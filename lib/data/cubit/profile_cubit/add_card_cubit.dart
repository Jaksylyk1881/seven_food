
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/repository/card_services.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState>{
  AddCardCubit() : super(AddCardStateInitial());
  Future<void> addCard() async{
    try{
      emit(AddCardStateLoading());
      final String _url = await CardServices().addCard();
      emit(AddCardStateLoaded(_url));
    }on ErrorException catch (e){
      emit(AddCardStateError(e.message));
    }
  }
}
