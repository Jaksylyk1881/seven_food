import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:seven_food/data/models/card/card.dart';
import 'package:seven_food/data/models/fridge_changed/fridge_changed.dart';
import 'package:seven_food/data/models/fridge_closed/fridge_closed.dart';
import 'package:seven_food/data/models/fridge_opened/fridge_opened.dart';

part 'fridge_state.dart';

class FridgeCubit extends Cubit<FridgeState>{
  FridgeCubit() : super(FridgeInitialState());
  FridgeOpened? fridgeOpened;
  PusherClient pusherClient = PusherClient("74637838c2f684d6db41", PusherOptions(
    cluster: "mt1",
  ),);
  late Channel channel;

  Future<void> initPusher(int id) async{
    pusherClient.connect();
    pusherClient.onConnectionStateChange((state) {
      log('pusher on connection change state');
      log(state?.currentState as String);
    });
    pusherClient.onConnectionError((error) {
      log('error from pusher on connection error');
      log(error!.message as String);
    });

    channel = pusherClient.subscribe('user.$id');
    log('subscribe user.$id');

    channel.bind('App\\Events\\FridgeOpened', (event) {

      var decodedData = jsonDecode(event!.data!);
      print(decodedData);
      fridgeOpened = FridgeOpened.fromJson(decodedData["data"] as Map<String, dynamic>);
      emit(FridgeLoadingState());
      emit(FridgeOpenedState(fridgeOpened!));
    });


    channel.bind('App\\Events\\FridgeProductChanged', (event) {
      var decodedData = jsonDecode(event!.data!);
      final FridgeChanged fridgeChanged = FridgeChanged.fromJson(decodedData["data"] as Map<String,dynamic>);
      print(decodedData);
      emit(FridgeLoadingState());
       emit(FridgeChangedState(fridgeOpened, fridgeChanged));
    });


    channel.bind('App\\Events\\FridgeClosed', (event) {
      var decodedData = jsonDecode(event!.data!);
      print(decodedData);
      final FridgeClosed fridgeClosed = FridgeClosed.fromJson(decodedData as Map<String, dynamic>);
      emit(FridgeLoadingState());
      emit(FridgeClosedState(fridgeClosed));
    });
  }

}
