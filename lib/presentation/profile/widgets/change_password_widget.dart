import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/extensions/input_validation.dart';
import 'package:hash_store/data/models/update_password_model.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/default_toast.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../shared_components/default_disabled_button.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  late final TextEditingController _oldPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _reNewPasswordController;
  late final GlobalKey<FormState> _formKey;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context.read<ProfileCubit>().updatePassword(
            updatePasswordModel: UpdatePasswordModel(
              password: _oldPasswordController.text.trim(),
              newPassword: _newPasswordController.text.trim(),
            ),
          );
    }
  }

  void _checkOfEmptyValue() {
    if (_oldPasswordController.text.isNotEmpty &&
        _newPasswordController.text.isNotEmpty &&
        _reNewPasswordController.text.isNotEmpty) {
      context.read<ProfileCubit>().changeIsEmpty(false);
    } else {
      context.read<ProfileCubit>().changeIsEmpty(true);
    }
  }

  @override
  void initState() {
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _reNewPasswordController = TextEditingController();
    _formKey = GlobalKey();
    _oldPasswordController.addListener(_checkOfEmptyValue);
    _newPasswordController.addListener(_checkOfEmptyValue);
    _reNewPasswordController.addListener(_checkOfEmptyValue);
    context.read<ProfileCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _reNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdatePasswordSuccessState) {
          Navigator.of(context).pop();
          defaultToast(text: 'Password changed successfully');
        } else if (state is UpdatePasswordErrorState) {
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        }
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 63.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          color: const Color(0xff1d1a27),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Change Password',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                flex: 5,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DefaultTextField(
                        text: 'Old Password',
                        isObscureText: context.watch<ProfileCubit>().isObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            context.read<ProfileCubit>().iconData,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<ProfileCubit>()
                                .changePasswordVisibility();
                          },
                        ),
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return 'Password must contain at least 8 characters\none uppercase letter and one lowercase letter';
                          }
                          return null;
                        },
                        controller: _oldPasswordController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultTextField(
                        text: 'New Password',
                        isObscureText:
                            context.watch<ProfileCubit>().newPasswordIsObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            context.read<ProfileCubit>().newPasswordIconData,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<ProfileCubit>()
                                .changeNewPasswordVisibility();
                          },
                        ),
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return 'Password must contain at least 8 characters\none uppercase letter and one lowercase letter';
                          }
                          return null;
                        },
                        controller: _newPasswordController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultTextField(
                        text: 'Re-type New Password',
                        isObscureText:
                            context.watch<ProfileCubit>().reNewIsObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            context.read<ProfileCubit>().reNewIconData,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<ProfileCubit>()
                                .changeReNewPasswordVisibility();
                          },
                        ),
                        validator: (val) {
                          if (val != _newPasswordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        controller: _reNewPasswordController,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Builder(
                  builder: (context) {
                    if (context.select((ProfileCubit p) => p.isEmpty)) {
                      return DefaultDisabledButton(
                        text: Text(
                          'Change Password',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      );
                    }
                    return DefaultGradientButton(
                      isFilled: true,
                      text: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                        if (state is UpdatePasswordLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Text(
                          'Change Password',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        );
                      }),
                      onPressed: _submit,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
