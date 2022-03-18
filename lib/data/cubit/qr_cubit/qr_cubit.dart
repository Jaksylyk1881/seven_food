import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/repository/fridge_services.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState>{
  QrCubit() : super(QrStateInitial());

  Future<void> openFridge(int fridgeId) async{
    try{
      emit(QrStateLoading());
      final int orderID = await FridgeService().openFridge(fridgeId);
      log("order id :::::::::: $orderID");
      emit(QrStateLoaded());
    }on ErrorException catch(e){
      log("$e");
      emit(QrStateError(e.message));
    }
  }


}
