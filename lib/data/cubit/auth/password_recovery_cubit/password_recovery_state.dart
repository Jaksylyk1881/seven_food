import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/repository/login_services.dart';

part 'password_recovery_cubit.dart';

abstract class PasswordRecoveryState {}
class PasswordRecoveryInitial extends PasswordRecoveryState{
}

class PasswordRecoveryLoading extends PasswordRecoveryState{}

class PasswordRecoverySuccess extends PasswordRecoveryState{}

class PasswordRecoveryError extends PasswordRecoveryState{
  String message;
  PasswordRecoveryError(this.message);
}
