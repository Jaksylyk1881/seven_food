
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/repository/card_services.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState>{
  AddCardCubit() : super(AddCardStateInitial());
  String _url = "";
  Future<void> addCard() async{
    try{
      emit(AddCardStateLoading());
      _url = await CardServices().addCard();
      emit(AddCardStateLoaded(_url));
    }catch(e){
      emit(AddCardStateError("$e"));
    }
  }
}
