import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Loading...'),
                ),
              );
            } else if (state is SignUpSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.response),
                duration: const Duration(milliseconds: 3000),
              ),);
            } else if (state is SignUpErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                duration: const Duration(milliseconds: 3000),
              ),);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    context.read<SignUpCubit>().signUp(
                          SignUPModel(
                            email: 'a@e.com',
                            password: '123456',
                            phone: '0123456789',
                          ),
                        );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
