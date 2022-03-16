import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());


  bool isEmpty = true;

}
