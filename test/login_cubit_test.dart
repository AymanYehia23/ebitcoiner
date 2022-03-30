import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/login_repo.dart';
import 'package:hash_store/logic/cubit/login/login_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStorage extends Mock implements SecureStorageRepo {}

class MockLoginRepo extends Mock implements LoginRepo {}


void main() {
  late MockSecureStorage mockSecureStorage;
  late LoginCubit sut;
  late MockLoginRepo mockLoginRepo;
  late LoginResponseModel loginResponseModel;

  setUp(
    () {
      mockSecureStorage = MockSecureStorage();

      loginResponseModel = LoginResponseModel(
          jwt:  Jwt('', ''),
          user:  User('userID', 'name', 'email', 'phone', Balance(0, 0), Balance(0, 0),
              0, 0, 0));
      mockLoginRepo = MockLoginRepo();
      sut =
          LoginCubit(mockLoginRepo, loginResponseModel, mockSecureStorage,);
    },
  );

  tearDown(
    () {
      sut.close();
    },
  );

  group(
    "login UI logic: ",
    () {
      test(
        "initial values are correct.",
        () {
          expect(sut.isEmpty, true);
          expect(sut.isObscure, true);
          expect(sut.iconData, Icons.visibility_outlined);
        },
      );

      test(
        "changePasswordVisibility method work correctly.",
        () {
          sut.changePasswordVisibility();
          expect(sut.isObscure, false);
          expect(sut.iconData, Icons.visibility_off_outlined);
          sut.changePasswordVisibility();
          expect(sut.isObscure, true);
          expect(sut.iconData, Icons.visibility_outlined);
        },
      );
      blocTest<LoginCubit, LoginState>(
        "the cubit should emit [ChangePasswordVisibilityStates] when (changePasswordVisibility) method called.",
        build: () => sut,
        act: (cubit) => cubit.changePasswordVisibility(),
        expect: () => <LoginState>[ChangePasswordVisibilityLoadingState(),ChangePasswordVisibilitySuccessState()],
      );
    },
  );

  group(
    "login business logic: ",
    () {
      blocTest<LoginCubit, LoginState>(
        """using loginRepo for (login),
        the cubit should emit [LoginLoadingState] when (login) method is called,
        if the data returned from the (postLogin) method the cubit should emit [LoginSuccessState].""",
        setUp: () {
          when(
            () => mockLoginRepo.postLogin(email: 'email', password: 'password'),
          ).thenAnswer(
            (_) async => loginResponseModel,
          );
        },
        verify: (_) {
          verify(
            () => mockLoginRepo.postLogin(email: 'email', password: 'password'),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) async =>
            await cubit.login(email: 'email', password: 'password'),
        expect: () => <LoginState>[LoginLoadingState(), LoginSuccessState()],
      );

      blocTest<LoginCubit, LoginState>(
        """using SecureStorageRepo for (saveTokens),
        the cubit should emit [LoginSaveTokensLoadingState] when (saveTokens) method is called,
        when the (SecureStorageRepo.addValue) method save tokens the cubit should emit [LoginSaveTokensSuccessState].""",
        setUp: () {
          when(
            () => mockSecureStorage.addValue(
              key: 'accessToken',
              value: loginResponseModel.jwt!.accessToken,
            ),
          ).thenAnswer(
            (_) async => Future.value(),
          );
          when(
            () => mockSecureStorage.addValue(
              key: 'refreshToken',
              value: loginResponseModel.jwt!.refreshToken,
            ),
          ).thenAnswer(
            (_) async => Future.value(),
          );
          
        },
        verify: (_) {
          verify(
            () => mockSecureStorage.addValue(
              key: 'accessToken',
              value: loginResponseModel.jwt!.accessToken,
            ),
          ).called(1);
          verify(
            () => mockSecureStorage.addValue(
              key: 'refreshToken',
              value: loginResponseModel.jwt!.refreshToken,
            ),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) async => await cubit.saveTokens(),
        expect: () => <LoginState>[
          SaveTokensLoadingState(),
          SaveTokensSuccessState()
        ],
      );

      blocTest<LoginCubit, LoginState>(
        """using SecureStorageRepo for (tryAutoLogin),
        the cubit should emit [AutoLoginLoadingState] when (tryAutoLogin) method is called,
        if the (SecureStorageRepo.containsKey) method return true the cubit should emit [LoginSuccessState].""",
        setUp: () {
          when(
            () => mockSecureStorage.containsKey(key: 'accessToken'),
          ).thenAnswer(
            (_) async => true,
          );
        },
        verify: (_) {
          verify(
            () => mockSecureStorage.containsKey(key: 'accessToken'),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) async => await cubit.tryAutoLogin(),
        expect: () =>
            <LoginState>[AutoLoginLoadingState(), AutoLoginSuccessState()],
      );
    },
  );
}
