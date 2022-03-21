import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/logic/cubit/delete_account/delete_account_cubit.dart';
import 'package:hash_store/logic/cubit/logout/logout_cubit.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../router/app_router.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return MultiBlocListener(
      listeners: [
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              Navigator.of(context).pushReplacementNamed(AppRouter.logIn);
            } else if (state is LogoutErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to logout'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
        ),
        BlocListener<DeleteAccountCubit, DeleteAccountState>(
          listener: (context, state) {
            if (state is DeleteAccountSuccessState) {
              Navigator.of(context).pushReplacementNamed(AppRouter.splash);
            } else if (state is DeleteAccountErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to delete account'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
        ),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s.w(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                Strings.profile,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: s.w(60)),
              ),
            ),
            SizedBox(
              height: s.h(15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: s.w(70)),
              child: DefaultGradientButton(
                isFilled: true,
                onPressed: () async {
                  await context.read<LogoutCubit>().logout();
                },
                text: Builder(builder: (context) {
                  final logoutState = context.watch<LogoutCubit>().state;
                  if (logoutState is LogoutLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(
                    'Logout',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 30),
                  );
                }),
              ),
            ),
            SizedBox(
              height: s.h(150),
            ),
            Form(
              key: _formKey,
              child: DefaultTextField(
                text: 'Password',
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You must enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: s.h(20),
            ),
            DefaultGradientButton(
              isFilled: false,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await context
                      .read<DeleteAccountCubit>()
                      .deleteAccount(password: _passwordController.text);
                }
              },
              text: Builder(builder: (context) {
                final deleteAccountState =
                    context.watch<DeleteAccountCubit>().state;
                if (deleteAccountState is DeleteAccountLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Text(
                  'Delete Account',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 30),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
