import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:seven_food/data/models/fridge_changed/fridge_changed.dart';
import 'package:seven_food/data/models/fridge_closed/fridge_closed.dart';
import 'package:seven_food/data/models/fridge_opened/fridge_opened.dart';

part 'fridge_state.dart';

class FridgeCubit extends Cubit<FridgeState> {
  FridgeCubit() : super(FridgeInitialState());
  FridgeOpened? _fridgeOpened;
  final PusherClient _pusherClient = PusherClient(
    "74637838c2f684d6db41",
    PusherOptions(
      cluster: "mt1",
    ),
  );
  late Channel _channel;

  Future<void> unSubscribe(int id) async{
    _channel.unbind('App\\Events\\FridgeOpened');
    _channel.unbind('App\\Events\\FridgeProductChanged');
    _channel.unbind('App\\Events\\FridgeClosed');
    _pusherClient.unsubscribe('user.$id');
    _pusherClient.disconnect();
  }

  Future<void> initPusher(int id) async {
    emit(FridgeInitialState());
    _pusherClient.connect();
    _pusherClient.onConnectionStateChange((state) {
      log('pusher on connection change state');
      log(state?.currentState as String);
    });
    _pusherClient.onConnectionError((error) {
      log('error from pusher on connection error');
      log(error!.message as String);
    });

    _channel = _pusherClient.subscribe('user.$id');
    log('subscribe user.$id');

    _channel.bind('App\\Events\\FridgeOpened', (event) {
      final decodedData = jsonDecode(event!.data!);
      _fridgeOpened =
          FridgeOpened.fromJson(decodedData["data"] as Map<String, dynamic>);
      emit(FridgeLoadingState());
      emit(FridgeOpenedState(_fridgeOpened!));
    });

    _channel.bind('App\\Events\\FridgeProductChanged', (event) {
      final decodedData = jsonDecode(event!.data!);
      final FridgeChanged fridgeChanged =
          FridgeChanged.fromJson(decodedData["data"] as Map<String, dynamic>);
      emit(FridgeLoadingState());
      emit(FridgeChangedState(_fridgeOpened, fridgeChanged));
    });

    _channel.bind('App\\Events\\FridgeClosed', (event) {
      final decodedData = jsonDecode(event!.data!);
      final FridgeClosed fridgeClosed =
          FridgeClosed.fromJson(decodedData as Map<String, dynamic>);
      emit(FridgeLoadingState());
      emit(FridgeClosedState(fridgeClosed));
    });
  }
}
