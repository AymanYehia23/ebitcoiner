import 'package:bloc/bloc.dart';
import 'package:hash_store/data/data_providers/sign_up_api.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  late SignUpRepo _signUpRepo;

  Future<String> signUp(SignUPModel signUPModel) async {
    emit(SignUpLoadingState());
    _signUpRepo = SignUpAPI();
    try {
      String res = await _signUpRepo.postSignUp(signUPModel: signUPModel);
      emit(SignUpSuccessState(response: res));
      print(res);
      return res;
    } catch (error) {
      emit(SignUpErrorState());
      print(error.toString());
      rethrow;
    }
  }
}
