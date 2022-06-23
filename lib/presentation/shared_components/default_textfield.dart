import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  final String text;
  final bool isObscureText;
  final String? suffixText;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final double? fontSize;
  final Color? borderColor;

  const DefaultTextField(
      {Key? key,
      required this.text,
      this.inputFormatters,
      this.isObscureText = false,
      this.suffixText,
      this.suffixIcon,
      this.validator,
      this.controller,
      this.inputType,
      this.enabled = true,
      this.readOnly = false,
      this.maxLines = 1,
      this.fontSize,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        labelStyle: Theme.of(context).textTheme.bodyText2,
        fillColor: ColorManager.darkPurple,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((2.w)),
          borderSide:  BorderSide(
            color: borderColor ?? ColorManager.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((2.w)),
          borderSide:  BorderSide(
            color: borderColor ?? ColorManager.lightGray,
          ),
        ),
        suffixIcon: suffixIcon == null ? const Text('') : suffixIcon!,
        suffixText: suffixText ?? '',
      ),
      obscureText: isObscureText,
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: inputType,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
