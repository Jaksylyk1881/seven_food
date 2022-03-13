part of 'login_state.dart';
class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());

  void initial(){
    emit(LoginInitial());
  }
  Future<void> loginByPhoneNumberAndPassword(String phoneNumber,String password) async{
    emit(LoginLoading());
    try {
     await LoginService().loginByNumAndPassword(phoneNumber, password);
       emit(LoginLogged());
  }catch(e){
      emit(LoginError('$e'));
    }
  }



  Future<void> loginByCode(String code) async{
    emit(LoginLoading());
    try{
      log("loading");
      final data = await LoginService().loginByCodeConfirmation(code);
      if(data==200){
        emit(LoginLogged());
      }else{
        emit(LoginError("$data"));
      }
    }catch(e){
      emit(LoginError("$e"));
    }
  }
}
