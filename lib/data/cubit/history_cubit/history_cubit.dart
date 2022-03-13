import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/models/history_main/history_main.dart';
import 'package:seven_food/data/repository/history_services.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit() : super(HistoryStateInitial());
  List<HistoryMain> _list = [];

  Future<void> getHistories() async{
    try{
      emit(HistoryStateLoading());
      _list = await HistoryServices().getHistories();
      emit(HistoryStateLoaded(_list));
    }catch(e){
      emit(HistoryStateError("$e"));
    }
  }


}
