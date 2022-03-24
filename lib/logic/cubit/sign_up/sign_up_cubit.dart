import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';


part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpInitialState());

  //Business logic
  Future<void> signUp(SignUPRequestModel signUPRequestModel) async {
    emit(SignUpLoadingState());
    try {
      await _signUpRepo.postSignUp(signUPRequestModel: signUPRequestModel);
      emit(SignUpSuccessState());
    } on DioError catch (error) {
      emit(SignUpErrorState(error: error.response!.data));
      return error.response!.data;
    }
  }


  //UI logic
  bool isEmpty = true;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
