import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/delete_account_model.dart';
import 'package:hash_store/data/models/logout_model.dart';
import 'package:hash_store/data/models/update_password_model.dart';
import 'package:hash_store/data/repositories/delete_account_repo.dart';
import 'package:hash_store/data/repositories/logout_repo.dart';
import 'package:hash_store/data/repositories/update_password_repo.dart';
import 'package:hash_store/logic/cubit/profile/profile_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockDeleteAccountRepo extends Mock implements DeleteAccountRepo {}

class MockUpdatePasswordRepo extends Mock implements UpdatePasswordRepo {}

class MockLogoutRepo extends Mock implements LogoutRepo {}

class MockSecureStorageRepo extends Mock implements SecureStorageRepo {}

void main() {
  late MockDeleteAccountRepo mockDeleteAccountRepo;
  late MockUpdatePasswordRepo mockUpdatePasswordRepo;
  late MockLogoutRepo mockLogoutRepo;
  late MockSecureStorageRepo mockSecureStorageRepo;
  late DeleteAccountModel deleteAccountModel;
  late UpdatePasswordModel updatePasswordModel;
  late LogoutModel logoutModel;
  late ProfileCubit sut;

  setUp(
    () {
      mockDeleteAccountRepo = MockDeleteAccountRepo();
      mockUpdatePasswordRepo = MockUpdatePasswordRepo();
      mockLogoutRepo = MockLogoutRepo();
      mockSecureStorageRepo = MockSecureStorageRepo();
      deleteAccountModel = DeleteAccountModel(
        password: 'password',
        refreshToken: 'refreshToken',
      );
      updatePasswordModel = UpdatePasswordModel(
        password: 'password',
        newPassword: 'newPassword',
      );
      logoutModel = LogoutModel(refreshToken: 'refreshToken');
      sut = ProfileCubit(
        mockDeleteAccountRepo,
        mockUpdatePasswordRepo,
        mockLogoutRepo,
        mockSecureStorageRepo,
      );
    },
  );

  tearDown(
    () {
      sut.close();
    },
  );

  group(
    'profile UI logic: ',
    () {
      test(
        "initial values are correct.",
        () {
          expect(sut.isEmpty, true);
          expect(sut.isObscure, true);
          expect(sut.iconData, Icons.visibility_outlined);
          expect(sut.newPasswordIsObscure, true);
          expect(sut.newPasswordIconData, Icons.visibility_outlined);
          expect(sut.reNewIsObscure, true);
          expect(sut.reNewIconData, Icons.visibility_outlined);
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
      blocTest<ProfileCubit, ProfileState>(
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
        expect: () => <ProfileState>[
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
        ],
      );
      blocTest<ProfileCubit, ProfileState>(
        """changeNewPasswordVisibility method work correctly.
        the cubit should first emit [ChangePasswordVisibilityInitialState],
        then emit [ChangePasswordVisibilitySuccessState] when (changeNewPasswordVisibility) method called.""",
        build: () => sut,
        act: (_) {
          sut.changeNewPasswordVisibility();
          expect(sut.newPasswordIsObscure, false);
          expect(sut.newPasswordIconData, Icons.visibility_off_outlined);
          sut.changeNewPasswordVisibility();
          expect(sut.newPasswordIsObscure, true);
          expect(sut.newPasswordIconData, Icons.visibility_outlined);
        },
        expect: () => <ProfileState>[
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
        ],
      );
      blocTest<ProfileCubit, ProfileState>(
        """changeReNewPasswordVisibility method work correctly.
        the cubit should first emit [ChangePasswordVisibilityInitialState],
        then emit [ChangePasswordVisibilitySuccessState] when (changeReNewPasswordVisibility) method called.""",
        build: () => sut,
        act: (_) {
          sut.changeReNewPasswordVisibility();
          expect(sut.reNewIsObscure, false);
          expect(sut.reNewIconData, Icons.visibility_off_outlined);
          sut.changeReNewPasswordVisibility();
          expect(sut.reNewIsObscure, true);
          expect(sut.reNewIconData, Icons.visibility_outlined);
        },
        expect: () => <ProfileState>[
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
          ChangePasswordVisibilityInitialState(),
          ChangePasswordVisibilitySuccessState(),
        ],
      );
    },
  );
  group(
    'profile business logic: ',
    () {
      //Arrange the deleteSavedTokens method to return future value
      void arrangeDeleteSavedTokensReturnsFuture() {
        when(
          () => mockSecureStorageRepo.deleteValue(key: 'accessToken'),
        ).thenAnswer((_) async => '');
        when(
          () => mockSecureStorageRepo.deleteValue(key: 'refreshToken'),
        ).thenAnswer((_) async => '');
      }

      //Assert that thr deleteSavedTokens method was called 1 time for accessToken & refreshToken
      void assertDeleteSavedTokensCalled() {
        verify(
          () => mockSecureStorageRepo.deleteValue(key: 'accessToken'),
        ).called(1);
        verify(
          () => mockSecureStorageRepo.deleteValue(key: 'refreshToken'),
        ).called(1);
      }

      blocTest<ProfileCubit, ProfileState>(
        """using (deleteAccountRepo.requestDeleteAccount) for (deleteAccount),
        the cubit should emit [DeleteAccountLoadingState] when (deleteAccount) method is called,
        if the (requestDeleteAccount) method send data correctly then (deleteSavedTokens) method will delete saved tokens,
        and the cubit should emit:
        [DeleteSavedRefreshTokenLoadingState,DeleteSavedRefreshTokenSuccessState,DeleteAccountSuccessState].""",
        setUp: () {
          when(
            () => mockDeleteAccountRepo.requestDeleteAccount(
              deleteAccountModel: deleteAccountModel,
            ),
          ).thenAnswer(
            (_) async => '',
          );
          arrangeDeleteSavedTokensReturnsFuture();
        },
        verify: (_) {
          verify(
            () => mockDeleteAccountRepo.requestDeleteAccount(
              deleteAccountModel: deleteAccountModel,
            ),
          ).called(1);
          assertDeleteSavedTokensCalled();
        },
        build: () => sut,
        act: (_) => sut.deleteAccount(
          deleteAccountModel: deleteAccountModel,
        ),
        expect: () => <ProfileState>[
          DeleteAccountLoadingState(),
          DeleteSavedRefreshTokenLoadingState(),
          DeleteSavedRefreshTokenSuccessState(),
          DeleteAccountSuccessState(),
        ],
      );
      blocTest<ProfileCubit, ProfileState>(
        """using (updatePasswordRepo.putUpdatePassword) for (updatePassword),
        the cubit should emit [UpdatePasswordLoadingState] when (updatePassword) method is called,
        if the (putUpdatePassword) method send data correctly the cubit should emit [UpdatePasswordSuccessState].""",
        setUp: () {
          when(
            () => mockUpdatePasswordRepo.putUpdatePassword(
              updatePasswordModel: updatePasswordModel,
            ),
          ).thenAnswer(
            (_) async => '',
          );
        },
        verify: (_) {
          verify(
            () => mockUpdatePasswordRepo.putUpdatePassword(
              updatePasswordModel: updatePasswordModel,
            ),
          ).called(1);
        },
        build: () => sut,
        act: (_) => sut.updatePassword(
          updatePasswordModel: updatePasswordModel,
        ),
        expect: () => <ProfileState>[
          UpdatePasswordLoadingState(),
          UpdatePasswordSuccessState(),
        ],
      );
      blocTest<ProfileCubit, ProfileState>(
        """using (logoutRepo.postLogout) for (logout),
        the cubit should emit [LogoutLoadingState] when (logout) method is called,
        if the (postLogout) method send data correctly then (deleteSavedTokens) method will delete saved tokens,
        and the cubit should emit:
        [DeleteSavedRefreshTokenLoadingState,DeleteSavedRefreshTokenSuccessState,LogoutSuccessState].""",
        setUp: () {
          when(
            () => mockLogoutRepo.postLogout(logoutModel: logoutModel),
          ).thenAnswer(
            (_) async => '',
          );
          arrangeDeleteSavedTokensReturnsFuture();
        },
        verify: (_) {
          verify(
            () => mockLogoutRepo.postLogout(logoutModel: logoutModel),
          ).called(1);
          assertDeleteSavedTokensCalled();
        },
        build: () => sut,
        act: (_) => sut.logout(logoutModel: logoutModel),
        expect: () => <ProfileState>[
          LogoutLoadingState(),
          DeleteSavedRefreshTokenLoadingState(),
          DeleteSavedRefreshTokenSuccessState(),
          LogoutSuccessState(),
        ],
      );
      test(
        """using (secureStorageRepo.getValue) for (getSavedRefreshToken),
        if secureStorage has refreshToken then the method will return it,
        else the method will return an empty string.""",
        () async {
          when(
            () => mockSecureStorageRepo.containsKey(key: 'refreshToken'),
          ).thenAnswer(
            (_) async => true,
          );
          when(
            () => mockSecureStorageRepo.getValue(key: 'refreshToken'),
          ).thenAnswer(
            (_) async => '',
          );
          await sut.getSavedRefreshToken();
          verify(
            () => mockSecureStorageRepo.containsKey(key: 'refreshToken'),
          ).called(1);
          verify(
            () => mockSecureStorageRepo.getValue(key: 'refreshToken'),
          ).called(1);
          when(
            () => mockSecureStorageRepo.containsKey(key: 'refreshToken'),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => mockSecureStorageRepo.getValue(key: 'refreshToken'),
          ).thenAnswer(
            (_) async => '',
          );
          await sut.getSavedRefreshToken();
          verify(
            () => mockSecureStorageRepo.containsKey(key: 'refreshToken'),
          ).called(1);
        },
      );
      blocTest<ProfileCubit, ProfileState>(
        """using (secureStorageRepo.deleteValue) for (deleteSavedTokens),
        the cubit should emit [DeleteSavedRefreshTokenLoadingState] when (deleteSavedTokens) method is called,
        if the (deleteValue) method delete tokens successfully the cubit should emit [DeleteSavedRefreshTokenSuccessState].""",
        setUp: () {
          arrangeDeleteSavedTokensReturnsFuture();
        },
        verify: (_) {
          assertDeleteSavedTokensCalled();
        },
        build: () => sut,
        act: (_) => sut.deleteSavedTokens(),
        expect: () => <ProfileState>[
          DeleteSavedRefreshTokenLoadingState(),
          DeleteSavedRefreshTokenSuccessState()
        ],
      );
    },
  );
}
