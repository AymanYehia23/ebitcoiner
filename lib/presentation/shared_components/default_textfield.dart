import 'package:flutter/material.dart';

import 'package:hash_store/presentation/sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  final String text;
  final bool isObscureText;
  final IconData? suffixIcon;
  const DefaultTextField({
    Key? key,
    required this.text,
    this.isObscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: const Color(0xffb7b4c7),
            ),
        fillColor: const Color(0xff302c3f),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.h(10)),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.h(10)),
          borderSide: const BorderSide(
            color: Color(0xffe6e6e6),
          ),
        ),
        suffixIcon: suffixIcon == null ? const Text('') :Icon(suffixIcon!,color: const Color(0xffe6e6e6),),
        
      ),
      obscureText: isObscureText,
    );
  }
}
