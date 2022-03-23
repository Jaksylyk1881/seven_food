import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/repository/login_services.dart';

part 'login_cubit.dart';
abstract class LoginState{}

class LoginInitial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginLogged extends LoginState{}
class LoginError extends LoginState{
  final String message;
  LoginError(this.message);
}
