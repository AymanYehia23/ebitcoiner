import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/enums.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/core/secure_storage/secure_storage.dart';
import 'package:ebitcoiner/data/models/login_model.dart';
import 'package:ebitcoiner/data/repositories/login_repo.dart';

import '../../../core/local_auth/local_auth_api.dart';

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
    if (await _secureStorage.containsKey(key: 'accessToken') &&
        await _secureStorage.containsKey(key: 'refreshToken')) {
      final isAuthenticated = await LocalAuthApi.authenticate();
      if (isAuthenticated == LocalAuth.authenticated) {
        emit(AutoLoginSuccessState());
      } else {
        if (isAuthenticated == LocalAuth.securityRequired) {
          emit(AuthErrorState());
        } else {
          SystemNavigator.pop();
        }
      }
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
    } else {
      _isEmpty = false;
    }
    emit(ChangeIsEmptyState());
  }

  void changePasswordVisibility() {
    _isObscure = !_isObscure;
    _iconData =
        _isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
