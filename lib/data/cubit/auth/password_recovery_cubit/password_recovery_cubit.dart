part of 'password_recovery_state.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryState>{
  PasswordRecoveryCubit() : super(PasswordRecoveryInitial());

  void initialState(){
    emit(PasswordRecoveryInitial());
  }

  Future<void> sendResponseToCode(String phoneNumber) async{
    try{
      emit(PasswordRecoveryLoading());
      await LoginService().loginByCode(phoneNumber);
        emit(PasswordRecoverySuccess());

    }catch(e){
      emit(PasswordRecoveryError('$e'));
    }
  }

}