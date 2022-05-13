import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/models/delete_account_model.dart';
import 'package:hash_store/data/models/logout_model.dart';
import 'package:hash_store/data/models/update_password_model.dart';
import 'package:hash_store/data/repositories/update_password_repo.dart';
import '../../../core/secure_storage/secure_storage.dart';
import '../../../data/repositories/delete_account_repo.dart';
import '../../../data/repositories/logout_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._deleteAccountRepo,
    this._updatePasswordRepo,
    this._logoutRepo,
    this._secureStorage,
  ) : super(ProfileInitial());

  //Business logic
  final DeleteAccountRepo _deleteAccountRepo;
  final UpdatePasswordRepo _updatePasswordRepo;
  final LogoutRepo _logoutRepo;
  final SecureStorageRepo _secureStorage;

  Future<void> deleteAccount({
    required DeleteAccountModel deleteAccountModel,
  }) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(DeleteAccountLoadingState());
    try {
      await _deleteAccountRepo.requestDeleteAccount(
        deleteAccountModel: deleteAccountModel,
      );
      await deleteSavedTokens();
      emit(DeleteAccountSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 401) {
        errorMessage = 'The password is incorrect';
      }
      emit(DeleteAccountErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(DeleteAccountErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> updatePassword(
      {required UpdatePasswordModel updatePasswordModel}) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(UpdatePasswordLoadingState());
    try {
      await _updatePasswordRepo.putUpdatePassword(
        updatePasswordModel: updatePasswordModel,
      );
      emit(UpdatePasswordSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 402) {
        errorMessage = 'The old password is incorrect';
      }
      emit(UpdatePasswordErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(UpdatePasswordErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> logout({required LogoutModel logoutModel}) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(LogoutLoadingState());
    try {
      await _logoutRepo.postLogout(
        logoutModel: logoutModel,
      );
      await deleteSavedTokens();
      emit(LogoutSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(LogoutErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(LogoutErrorState(errorMessage: errorMessage));
    }
  }

  Future<String?> getSavedRefreshToken() async {
    if (await _secureStorage.containsKey(key: 'refreshToken')) {
      return await _secureStorage.getValue(key: 'refreshToken');
    }
    return '';
  }

  Future<void> deleteSavedTokens() async {
    emit(DeleteSavedRefreshTokenLoadingState());
    await _secureStorage.deleteValue(key: 'accessToken');
    await _secureStorage.deleteValue(key: 'refreshToken');
    emit(DeleteSavedRefreshTokenSuccessState());
  }

  //UI logic
  bool _isEmpty = true;
  get isEmpty => _isEmpty;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;
  bool newPasswordIsObscure = true;
  IconData newPasswordIconData = Icons.visibility_outlined;
  bool reNewIsObscure = true;
  IconData reNewIconData = Icons.visibility_outlined;

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
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }

  void changeNewPasswordVisibility() {
    emit(ChangePasswordVisibilityInitialState());
    newPasswordIsObscure = !newPasswordIsObscure;
    newPasswordIconData = newPasswordIsObscure
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }

  void changeReNewPasswordVisibility() {
    emit(ChangePasswordVisibilityInitialState());
    reNewIsObscure = !reNewIsObscure;
    reNewIconData = reNewIsObscure
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }
}
