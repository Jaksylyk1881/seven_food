import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/repository/card_services.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState>{
  AddCardCubit() : super(AddCardStateInitial());
  Future<void> addCard({required String cardNumber, required String cardDate,required String cardCVC,required String name}) async{
    emit(AddCardStateLoading());
     try{
      await CardServices().addCard(cardNumber: cardNumber, cardDate: cardDate, cardCVC: cardCVC, name: name);
      emit(AddCardStateLoaded());
    }on ErrorException catch (e){
      emit(AddCardStateError(e.message));
    }
  }
}
