part of 'profile_cubit.dart';


abstract class ProfileState{}

class ProfileStateInitial extends ProfileState{}
class ProfileStateLoading extends ProfileState{}
class ProfileStateLoaded extends ProfileState{
  List<Cardd> cards;
  String bonus;
  ProfileStateLoaded(this.cards,this.bonus);
}
class ProfileStateError extends ProfileState{
  String message;
  ProfileStateError(this.message);
}
