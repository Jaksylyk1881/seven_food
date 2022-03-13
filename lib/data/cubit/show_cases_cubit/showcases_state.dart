part of 'showcases_cubit.dart';

abstract class ShowcasesState{}

class ShowcasesStateInitial extends ShowcasesState{}
class ShowcasesStateLoading extends ShowcasesState{}
class ShowcasesStateLoaded extends ShowcasesState{
  List<Showcases> showcases;
  ShowcasesStateLoaded(this.showcases);
}
class ShowcasesStateError extends ShowcasesState{
  String message;
  ShowcasesStateError(this.message);
}
