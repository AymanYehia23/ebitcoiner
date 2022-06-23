import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomCountryCode extends StatelessWidget {
  const CustomCountryCode({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.7.h,
      decoration: BoxDecoration(
        color: ColorManager.darkPurple,
        border: Border.all(
          color: ColorManager.white,
        ),
        borderRadius: BorderRadius.circular((10)),
      ),
      child: CountryCodePicker(
        textStyle: Theme.of(context).textTheme.bodyText2,
        initialSelection: 'eg',
        dialogBackgroundColor: ColorManager.black.withOpacity(0.8),
        dialogSize: Size(60.w, 45.h),
        dialogTextStyle: Theme.of(context).textTheme.bodyText2,
        searchDecoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyText2,
          fillColor: ColorManager.darkWhite,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((10)),
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((10)),
            borderSide: const BorderSide(
              color: ColorManager.lightGray,
            ),
          ),
        ),
        onChanged: (value) {
          context.read<SignUpCubit>().countryCode = value.dialCode.toString();
        },
      ),
    );
  }
}
