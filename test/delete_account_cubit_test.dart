import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/data/repositories/delete_account_repo.dart';
import 'package:hash_store/logic/cubit/delete_account/delete_account_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockDeleteAccountRepo extends Mock implements DeleteAccountRepo {}

void main() {
  late MockDeleteAccountRepo mockDeleteAccountRepo;
  late DeleteAccountCubit sut;

  setUp(() {
    mockDeleteAccountRepo = MockDeleteAccountRepo();
    sut = DeleteAccountCubit(mockDeleteAccountRepo);
  });

  group(
    'deleteAccount business logic: ',
    () {
      blocTest<DeleteAccountCubit, DeleteAccountState>(
        """using deleteAccountRepo for (deleteAccount),
        the cubit should emit [DeleteAccountLoadingState] when (deleteAccount) method is called,
        if the (requestDeleteAccount) method send data correctly the cubit should emit [DeleteAccountSuccessState].""",
        setUp: () {
          when(
            () => mockDeleteAccountRepo.requestDeleteAccount(
                password: 'password', refreshToken: 'refreshToken'),
          ).thenAnswer(
            (invocation) => Future.value(),
          );
        },
        verify: (_) {
          verify(
            () => mockDeleteAccountRepo.requestDeleteAccount(
                password: 'password', refreshToken: 'refreshToken'),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) => cubit.deleteAccount(
            password: 'password', refreshToken: 'refreshToken'),
        expect: () => <DeleteAccountState>[
          DeleteAccountLoadingState(),
          DeleteAccountSuccessState()
        ],
      );
    },
  );
}
