import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/repositories/logout_repo.dart';
import 'package:hash_store/logic/cubit/logout/logout_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockLogoutRepo extends Mock implements LogoutRepo {}

class MockSecureStorageRepo extends Mock implements SecureStorageRepo {}

void main() {
  late MockSecureStorageRepo mockSecureStorageRepo;
  late MockLogoutRepo mockLogoutRepo;
  late LogoutCubit sut;

  setUp(() {
    mockSecureStorageRepo = MockSecureStorageRepo();
    mockLogoutRepo = MockLogoutRepo();
    sut = LogoutCubit(mockLogoutRepo, mockSecureStorageRepo);
  });

  group(
    'logout business logic: ',
    () {
      blocTest<LogoutCubit, LogoutState>(
        """using logoutRepo for (logout),
        the cubit should emit [LogoutLoadingState] when (logout) method is called,
        if the (postLogout) method send data correctly the cubit should emit [LogoutSuccessState].""",
        setUp: () {
          when(
            () => mockLogoutRepo.postLogout(refreshToken: 'refreshToken'),
          ).thenAnswer(
            (_) async => Future.value(),
          );
        },
        verify: (_) {
          verify(
            () => mockLogoutRepo.postLogout(refreshToken: 'refreshToken'),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) => cubit.logout('refreshToken'),
        expect: () => <LogoutState>[LogoutLoadingState(), LogoutSuccessState()],
      );
      blocTest<LogoutCubit, LogoutState>(
        """using secureStorageRepo for (getSavedRefreshToken),
        the cubit should emit [GetSavedRefreshTokenLoadingState] when (getSavedRefreshToken) method is called,
        if the refreshToken returned from (getValue) method the cubit should emit [GetSavedRefreshTokenSuccessState].""",
        setUp: () {
          when(
            () => mockSecureStorageRepo.getValue(key: 'refreshToken'),
          ).thenAnswer(
            (_) async => 'returnedRefreshToken',
          );
        },
        verify: (_) {
          verify(
            () => mockSecureStorageRepo.getValue(key: 'refreshToken'),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) => cubit.getSavedRefreshToken(),
        expect: () => <LogoutState>[
          GetSavedRefreshTokenLoadingState(),
          GetSavedRefreshTokenSuccessState()
        ],
      );

      blocTest<LogoutCubit, LogoutState>(
        """using secureStorageRepo for (deleteSavedTokens),
        the cubit should emit [DeleteSavedRefreshTokenLoadingState] when (deleteSavedTokens) method is called,
        if the (deleteValue) method delete tokens successfully the cubit should emit [DeleteSavedRefreshTokenSuccessState].""",
        setUp: () {
           when(
            () => mockSecureStorageRepo.deleteValue(key: 'accessToken'),
          ).thenAnswer(
            (_) async => Future.value(),
          );
          when(
            () => mockSecureStorageRepo.deleteValue(key: 'refreshToken'),
          ).thenAnswer(
            (_) async => Future.value(),
          );
        },
        verify: (_) {
           verify(
            () => mockSecureStorageRepo.deleteValue(key: 'accessToken'),
          ).called(1);
          verify(
            () => mockSecureStorageRepo.deleteValue(key: 'refreshToken'),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) => cubit.deleteSavedTokens(),
        expect: () => <LogoutState>[
          DeleteSavedRefreshTokenLoadingState(),
          DeleteSavedRefreshTokenSuccessState()
        ],
      );
    },
  );
}
