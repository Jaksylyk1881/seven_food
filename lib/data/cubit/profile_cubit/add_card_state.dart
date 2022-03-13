part of 'add_card_cubit.dart';


abstract class AddCardState{}

class AddCardStateInitial extends AddCardState{}
class AddCardStateLoading extends AddCardState{}
class AddCardStateLoaded extends AddCardState{
  String url;
  AddCardStateLoaded(this.url);
}
class AddCardStateError extends AddCardState{
  String message;
  AddCardStateError(this.message);
}
