import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/extensions/input_validation.dart';
import 'package:ebitcoiner/data/models/delete_account_model.dart';
import 'package:ebitcoiner/presentation/shared_components/default_disabled_button.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:ebitcoiner/presentation/shared_components/default_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../router/app_router.dart';
import '../../shared_components/default_toast.dart';
import '../../shared_components/loading_dialog.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<DeleteAccountWidget> {
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context.read<ProfileCubit>().deleteAccount(
            deleteAccountModel: DeleteAccountModel(
              password: _passwordController.text.trim(),
              refreshToken:
                  await context.read<ProfileCubit>().getSavedRefreshToken(),
            ),
          );
    }
  }

  void _checkOfEmptyValue() {
    if (_passwordController.text.isNotEmpty) {
      context.read<ProfileCubit>().changeIsEmpty(false);
    } else {
      context.read<ProfileCubit>().changeIsEmpty(true);
    }
  }

  @override
  void initState() {
    _passwordController = TextEditingController();
    _formKey = GlobalKey();
    _passwordController.addListener(_checkOfEmptyValue);
    context.read<ProfileCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is DeleteSavedTokensSuccessState) {
          Navigator.of(context).pop();
          Navigator.of(context).popAndPushNamed(AppRouter.onboarding);
        } else if (state is DeleteSavedTokensLoadingState ||
            state is DeleteAccountLoadingState) {
          loadingDialog(context: context);
        } else if (state is DeleteAccountErrorState) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        }
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          color: ColorManager.primary,
          height: 35.h,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Delete Account',
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
                flex: 2,
                child: Form(
                  key: _formKey,
                  child: DefaultTextField(
                    text: 'Password',
                    validator: (val) {
                      if (!val!.isValidPassword) {
                        return 'Password must contain at least 8 characters\none uppercase letter and one lowercase letter';
                      }
                      return null;
                    },
                    isObscureText: context.watch<ProfileCubit>().isObscure,
                    suffixIcon: IconButton(
                      icon: Icon(
                        context.read<ProfileCubit>().iconData,
                        color: ColorManager.white,
                      ),
                      onPressed: () {
                        context.read<ProfileCubit>().changePasswordVisibility();
                      },
                    ),
                    controller: _passwordController,
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (context.select((ProfileCubit p) => p.isEmpty)) {
                    return Expanded(
                      flex: 1,
                      child: DefaultDisabledButton(
                        text: Text(
                          'Delete',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    );
                  }
                  return DefaultGradientButton(
                    isFilled: true,
                    text: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: _submit,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
