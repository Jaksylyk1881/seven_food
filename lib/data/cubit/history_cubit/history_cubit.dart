import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/models/history_main/history_main.dart';
import 'package:seven_food/data/repository/history_services.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit() : super(HistoryStateInitial());
  List<HistoryMain> _list = [];
  int _currentPage = 1;


  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
  }

  Future<void> getHistoryRefresh() async{
    try{
      emit(HistoryStateLoading());
      _currentPage=1;
      final data = await HistoryServices().getHistories(_currentPage);
      log("ON REFRESH:: , page:: $_currentPage");
      _list = data;
      _currentPage++;
      emit(HistoryStateLoaded(_list));
    }on ErrorException catch(e){
      emit(HistoryStateError(e.message));
    }
  }
  Future<void> getHistoriesLoad() async{
    try{
      final data = await HistoryServices().getHistories(_currentPage);
      if(data.isNotEmpty){
        _currentPage++;
      }
      log("ON LOADING:: , page:: $_currentPage");
      _list.addAll(data);
      emit(HistoryStateLoaded(_list));
    }on ErrorException catch(e){
      emit(HistoryStateError(e.message));
    }
  }


}
