import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/models/card/card.dart';
import 'package:seven_food/data/repository/card_services.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileStateInitial());
  List<Cardd> _list = [];

  Future<void> getCards() async{
    try{
      emit(ProfileStateLoading());
      _list = await CardServices().getCards();
      emit(ProfileStateLoaded(_list));
    }catch(e){
      emit(ProfileStateError("$e"));
    }
  }


}
