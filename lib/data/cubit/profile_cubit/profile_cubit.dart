import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/models/card/card.dart';
import 'package:seven_food/data/repository/card_services.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileStateInitial());
  List<Cardd> _list = [];
  String bonus = "";
  Future<void> getCards() async{
    try{
      emit(ProfileStateLoading());

      _list = await CardServices().getCards();
      bonus = await CardServices().getBonus();
      emit(ProfileStateLoaded(_list,bonus));
    }on ErrorException catch(e){
      log("$e");
      emit(ProfileStateError(e.message));
    }
  }
  Future<void> deleteCard(int id) async{
    emit(ProfileStateLoading());
    try{
      await CardServices().deleteCard(id);
      _list = await CardServices().getCards();
      bonus = await CardServices().getBonus();
      emit(ProfileStateLoaded(_list,bonus));
    }on ErrorException catch(e){
      emit(ProfileStateError(e.message));
    }
  }

}
