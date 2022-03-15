import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpRepo signUpRepo;
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitialState());

  Future<String> signUp(SignUPModel signUPModel) async {
    emit(SignUpLoadingState());
    try {
      String res = await signUpRepo.postSignUp(signUPModel: signUPModel);
      emit(SignUpSuccessState(response: res));
      print(res);
      return res;
    } on DioError catch (error) {
      emit(SignUpErrorState(error: error.response!.data));
      print(error.response!.data);
      return error.response!.data;
    }
  }
}
