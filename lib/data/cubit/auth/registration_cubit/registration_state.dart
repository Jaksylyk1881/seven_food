part of 'registration_cubit.dart';
abstract class RegState{}

class RegInitial extends RegState{}
class RegLoading extends RegState{}
class RegSuccess extends RegState{}
class RegError extends RegState{
  final String message;
  RegError(this.message);
}