import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockSignUpRepo extends Mock implements SignUpRepo {}

void main() {
  late SignUpCubit sut;
  late MockSignUpRepo mockSignUpRepo;
  late SignUPRequestModel signUPRequestModel;

  setUp(
    () {
      EquatableConfig.stringify = true;
      signUPRequestModel = SignUPRequestModel(
        name: 'testName',
        email: 'testEmail',
        password: 'testPassword',
        phone: 'testPhone',
      );
      mockSignUpRepo = MockSignUpRepo();
      sut = SignUpCubit(mockSignUpRepo);
    },
  );

  tearDown(
    () {
      sut.close();
    },
  );

  group(
    "signUp UI logic: ",
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
      blocTest<SignUpCubit, SignUpState>(
        "the cubit should emit [ChangePasswordVisibilityState] when (changePasswordVisibility) method called.",
        build: () => sut,
        act: (cubit) => cubit.changePasswordVisibility(),
        expect: () => <SignUpState>[ChangePasswordVisibilityState()],
      );
    },
  );

  group(
    "signUp business logic: ",
    () {
      //arrange the postSignUp method in the mockSignUPRepo
      void arrangeSignUpRepoReturnsString() {
        when(
          () =>
              mockSignUpRepo.postSignUp(signUPRequestModel: signUPRequestModel),
        ).thenAnswer(
          (_) async => 'testString',
        );
      }

      blocTest<SignUpCubit, SignUpState>(
        """using signUpRepo for sign up,
        the cubit should emit [SignUpLoadingState] when (signUp) method is called,
        if the data returned from the (postSignUp) method the cubit should emit [SignUpSuccessState].""",
        setUp: arrangeSignUpRepoReturnsString,
        verify: (_) {
          verify(
            () => mockSignUpRepo.postSignUp(
              signUPRequestModel: signUPRequestModel,
            ),
          ).called(1);
        },
        build: () => sut,
        act: (cubit) async => await cubit.signUp(signUPRequestModel),
        expect: () => <SignUpState>[SignUpLoadingState(), SignUpSuccessState()],
      );
    },
  );
}
