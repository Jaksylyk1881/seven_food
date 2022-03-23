import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/repository/login_services.dart';

part 'registration_state.dart';

class RegCubit extends Cubit<RegState>{
  RegCubit() : super(RegInitial());

  void initialState(){
    emit(RegInitial());
  }

  Future<void> registering(String name, String phoneNumber, String password, String passwordConfirmation) async{
    emit(RegLoading());
    try{
      await LoginService().registration(name, phoneNumber, password, passwordConfirmation);
        emit(RegSuccess());
    }on ErrorException catch(e){
      emit(RegError(e.message));
    }
  }

}
