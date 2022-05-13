import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginRepo,
    this._loginResponseModel,
    this._secureStorage,
  ) : super(LoginInitial());

  //Business logic
  final SecureStorageRepo _secureStorage;
  final LoginRepo _loginRepo;
  LoginResponseModel _loginResponseModel;
  String userName = '';
  String password = '';

  Future<void> firstLoginAuth(
      {required FirstLoginRequestModel firstLoginRequestModel}) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(FirstLoginLoadingState());
    try {
      await _loginRepo.fPostLogin(
        firstLoginRequestModel: firstLoginRequestModel,
      );
      emit(FirstLoginSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.data['message'] == 'Wrong credentials') {
        errorMessage = 'Invalid username or password';
      }
      emit(FirstLoginErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(FirstLoginErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> secondeLoginAuth(
      {required SecondLoginRequestModel secondLoginRequestModel}) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(SecondeLoginLoadingState());
    try {
      _loginResponseModel = await _loginRepo.sPostLogin(
        secondLoginRequestModel: secondLoginRequestModel,
      );
      await saveTokens();
      emit(SecondLoginSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 400) {
        errorMessage = 'Wrong OTP';
      }
      emit(SecondLoginErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(SecondLoginErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> saveTokens() async {
    await _secureStorage.addValue(
        key: 'accessToken', value: _loginResponseModel.jwt?.accessToken);
    await _secureStorage.addValue(
      key: 'refreshToken',
      value: _loginResponseModel.jwt?.refreshToken,
    );
  }

  Future<void> tryAutoLogin() async {
    emit(AutoLoginLoadingState());
    if (await _secureStorage.containsKey(key: 'accessToken')) {
      if (kDebugMode) {
        print(await _secureStorage.getValue(key: 'accessToken'));
      }
      if (kDebugMode) {
        print(await _secureStorage.getValue(key: 'refreshToken'));
      }

      emit(AutoLoginSuccessState());
    } else {
      emit(AutoLoginFailedState());
    }
  }

  //UI logic
  bool _isEmpty = true;
  get isEmpty => _isEmpty;
  bool _isObscure = true;
  get isObscure => _isObscure;
  IconData _iconData = Icons.visibility_outlined;
  get iconData => _iconData;

  void changeIsEmpty(bool i) {
    if (i) {
      _isEmpty = true;
      emit(ChangeIsEmptyTrueState());
    } else {
      _isEmpty = false;
      emit(ChangeIsEmptyFalseState());
    }
  }

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityInitialState());
    _isObscure = !_isObscure;
    _iconData =
        _isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }
}
