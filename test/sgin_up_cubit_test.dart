import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockSignUpRepo extends Mock implements SignUpRepo {}

void main() {
  late MockSignUpRepo mockSignUpRepo;
  late SignUPRequestModel signUPRequestModel;
  late SignUpCubit sut;

  setUp(
    () {
      mockSignUpRepo = MockSignUpRepo();
      signUPRequestModel = SignUPRequestModel(
        userName: 'userName',
        email: 'email',
        password: 'password',
        phone: 'phone',
      );
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
          expect(sut.countryCode, '+20');
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
      blocTest<SignUpCubit, SignUpState>(
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
        expect: () => <SignUpState>[
          ChangePasswordVisibilityLoadingState(),
          ChangePasswordVisibilitySuccessState(),
          ChangePasswordVisibilityLoadingState(),
          ChangePasswordVisibilitySuccessState(),
        ],
      );
    },
  );

  group(
    "signUp business logic: ",
    () {
      //arrange the postSignUp method in the mockSignUPRepo
      blocTest<SignUpCubit, SignUpState>(
        """using (signUpRepo.postSignUp) for (signUp),
        the cubit should emit [SignUpLoadingState] when (signUp) method is called,
        if the data returned from the (postSignUp) method the cubit should emit [SignUpSuccessState].""",
        setUp: () {
          when(
            () => mockSignUpRepo.postSignUp(
              signUPRequestModel: signUPRequestModel,
            ),
          ).thenAnswer(
            (_) async => 'testString',
          );
        },
        verify: (_) {
          verify(
            () => mockSignUpRepo.postSignUp(
              signUPRequestModel: signUPRequestModel,
            ),
          ).called(1);
        },
        build: () => sut,
        act: (_) => sut.signUp(signUPRequestModel),
        expect: () => <SignUpState>[SignUpLoadingState(), SignUpSuccessState()],
      );
    },
  );
}
