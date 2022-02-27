part of 'verification_state.dart';
class VerificationCubit extends Cubit<VerificationState>{
  VerificationCubit() : super(VerificationInitial());
  void initialState(){
    emit(VerificationInitial());
  }
  Future<void> loginByCode(String code) async{
    try{
      emit(VerificationLoading());
      log("loading");
      final data = await LoginService().loginByCodeConfirmation(code);
      if(data==200){
        emit(VerificationLogged());
      }else{
        emit(VerificationError("$data"));
      }
    }catch(e){
      emit(VerificationError("$e"));
    }
  }

  Future<void> registerCode(String code) async{
    try{
      emit(VerificationLoading());
      log("loading");
      final data = await LoginService().registerConfirmation(code);
      if(data==200){
        emit(VerificationLogged());
      }else{
        emit(VerificationError("$data"));
      }
    }catch(e){
      emit(VerificationError("$e"));
    }
  }
}