part of 'add_card_cubit.dart';


abstract class AddCardState{}

class AddCardStateInitial extends AddCardState{}
class AddCardStateLoading extends AddCardState{}
class AddCardStateLoaded extends AddCardState{
}
class AddCardStateError extends AddCardState{
  String message;
  AddCardStateError(this.message);
}
