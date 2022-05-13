import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/login_repo.dart';
import 'package:hash_store/logic/cubit/login/login_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepo extends Mock implements LoginRepo {}

class MockSecureStorage extends Mock implements SecureStorageRepo {}

void main() {
  late MockLoginRepo mockLoginRepo;
  late FirstLoginRequestModel firstLoginRequestModel;
  late SecondLoginRequestModel secondLoginRequestModel;
  late LoginResponseModel loginResponseModel;
  late MockSecureStorage mockSecureStorage;
  late LoginCubit sut;

  setUp(
    () {
      mockLoginRepo = MockLoginRepo();
      firstLoginRequestModel =
          FirstLoginRequestModel(userName: 'userName', password: 'password');
      secondLoginRequestModel =
          SecondLoginRequestModel(userName: 'userName', otp: 'otp');
      loginResponseModel = LoginResponseModel();
      mockSecureStorage = MockSecureStorage();
      sut = LoginCubit(
        mockLoginRepo,
        loginResponseModel,
        mockSecureStorage,
      );
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
        "changeIsEmpty method work correctly.",
        () {
          sut.changeIsEmpty(true);
          expect(sut.isEmpty, true);
          sut.changeIsEmpty(false);
          expect(sut.isEmpty, false);
        },
      );
      blocTest<LoginCubit, LoginState>(
        """changePasswordVisibility method work correctly.
        the cubit should first emit [ChangePasswordVisibilityInitialState],
        then emit [ChangePasswordVisibilitySuccessState] when (changePasswordVisibility) method called.""",
        build: () => sut,
        act: (_) {
          sut.changePasswordVisibility();
          expect(sut.isObscure, false);
          expect(sut.iconData, Icons.visibility_off_outlined);
          sut.changePasswordVisibility();
          expect(sut.isObscure, true);
          expect(sut.iconData, Icons.visibility_outlined);
        },
        expect: () => <LoginState>[
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
        ],
      );
    },
  );

  group(
    "login business logic: ",
    () {

      //Arrange the saveTokens method to return future value
      void arrangeSaveTokensReturnsFuture() {
        when(
          () => mockSecureStorage.addValue(
            key: 'accessToken',
            value: loginResponseModel.jwt?.accessToken,
          ),
        ).thenAnswer(
          (_) async => '',
        );
        when(
          () => mockSecureStorage.addValue(
            key: 'refreshToken',
            value: loginResponseModel.jwt?.refreshToken,
          ),
        ).thenAnswer(
          (_) async => '',
        );
      }

      //Assert that thr saveTokens method was called 1 time for accessToken & refreshToken
      void assertSaveTokensCalled() {
        verify(
          () => mockSecureStorage.addValue(
            key: 'accessToken',
            value: loginResponseModel.jwt?.accessToken,
          ),
        ).called(1);
        verify(
          () => mockSecureStorage.addValue(
            key: 'refreshToken',
            value: loginResponseModel.jwt?.refreshToken,
          ),
        ).called(1);
      }
      
      test(
        "initial values are correct.",
        () {
          expect(sut.userName, '');
          expect(sut.password, '');
        },
      );

      blocTest<LoginCubit, LoginState>(
        """using (loginRepo.fPostLogin) for (firstLoginAuth)
        the cubit should emit [FirstLoginLoadingState] when (firstLoginAuth) method is called
        if the data returned from the (fPostLogin) method the cubit should emit [FirstLoginSuccessState].""",
        setUp: () {
          when(
            () => mockLoginRepo.fPostLogin(
              firstLoginRequestModel: firstLoginRequestModel,
            ),
          ).thenAnswer(
            (_) async => '',
          );
        },
        verify: (_) {
          verify(
            () => mockLoginRepo.fPostLogin(
              firstLoginRequestModel: firstLoginRequestModel,
            ),
          ).called(1);
        },
        build: () => sut,
        act: (_) {
          sut.firstLoginAuth(firstLoginRequestModel: firstLoginRequestModel);
        },
        expect: () => <LoginState>[
          FirstLoginLoadingState(),
          FirstLoginSuccessState(),
        ],
      );
      blocTest<LoginCubit, LoginState>(
        """using (loginRepo.sPostLogin) for (secondeLoginAuth),
        the cubit should emit [SecondeLoginLoadingState] when (secondeLoginAuth) method is called,
        if the data returned from the (sPostLogin) method and the (SecureStorage) saves tokens the cubit should emit [SecondLoginSuccessState].""",
        setUp: () {
          arrangeSaveTokensReturnsFuture();
          when(
            () => mockLoginRepo.sPostLogin(
              secondLoginRequestModel: secondLoginRequestModel,
            ),
          ).thenAnswer(
            (_) async => loginResponseModel,
          );
        },
        verify: (_) {
          verify(
            () => mockLoginRepo.sPostLogin(
              secondLoginRequestModel: secondLoginRequestModel,
            ),
          ).called(1);
          assertSaveTokensCalled();
        },
        build: () => sut,
        act: (_) => sut.secondeLoginAuth(
          secondLoginRequestModel: secondLoginRequestModel,
        ),
        expect: () => <LoginState>[
          SecondeLoginLoadingState(),
          SecondLoginSuccessState(),
        ],
      );
      test(
        "using SecureStorageRepo for (saveTokens).",
        () async {
          arrangeSaveTokensReturnsFuture();
          await sut.saveTokens();
          assertSaveTokensCalled();
        },
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
        act: (_) => sut.tryAutoLogin(),
        expect: () =>
            <LoginState>[AutoLoginLoadingState(), AutoLoginSuccessState()],
      );
    },
  );
}
