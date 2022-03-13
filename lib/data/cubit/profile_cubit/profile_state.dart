part of 'profile_cubit.dart';


abstract class ProfileState{}

class ProfileStateInitial extends ProfileState{}
class ProfileStateLoading extends ProfileState{}
class ProfileStateLoaded extends ProfileState{
  List<Cardd> cards;
  ProfileStateLoaded(this.cards);
}
class ProfileStateError extends ProfileState{
  String message;
  ProfileStateError(this.message);
}
