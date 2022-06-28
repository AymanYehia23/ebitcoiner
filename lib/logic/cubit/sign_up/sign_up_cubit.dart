import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/models/sign_up_model.dart';
import 'package:ebitcoiner/data/repositories/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitialState());
  final SignUpRepo _signUpRepo;

  //Business logic
  Future<void> signUp(SignUPRequestModel signUPRequestModel) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(SignUpLoadingState());
    try {
      await _signUpRepo.postSignUp(signUPRequestModel: signUPRequestModel);
      emit(SignUpSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.data.toString() == "User Name is used") {
        errorMessage = 'User Name is used';
      } else if (error.response!.data.toString() == "Email is used") {
        errorMessage = 'Email is used';
      } else if (error.response!.data.toString() == "Phone is used") {
        errorMessage = 'Phone is used';
      }
      emit(SignUpErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(SignUpErrorState(errorMessage: errorMessage));
    }
  }

  //UI logic
  bool isEmpty = true;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;
  String countryCode = '+20';

  void changeIsEmpty(bool i) {
    if (i) {
      isEmpty = true;
    } else {
      isEmpty = false;
    }
    emit(ChangeIsEmptyState());
  }

  void changePasswordVisibility() {
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
