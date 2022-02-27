import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/repository/login_services.dart';
import 'dart:developer';

part 'verification_cubit.dart';
abstract class VerificationState{}

class VerificationInitial extends VerificationState{}
class VerificationLoading extends VerificationState{}
class VerificationLogged extends VerificationState{}
class VerificationError extends VerificationState{
  final String message;
  VerificationError(this.message);
}