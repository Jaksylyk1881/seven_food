import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/models/showcases/showcases.dart';
import 'package:seven_food/data/repository/showcases_services.dart';

part 'showcases_state.dart';

class ShowcasesCubit extends Cubit<ShowcasesState>{
  ShowcasesCubit() : super(ShowcasesStateInitial());
  List<Showcases> _list = [];

  Future<void> getShowcases() async{
    try{
      emit(ShowcasesStateLoading());
      _list = await ShowcasesService().getShowcases();
      emit(ShowcasesStateLoaded(_list));
    }catch(e){
      emit(ShowcasesStateError("$e"));
    }
  }

}
