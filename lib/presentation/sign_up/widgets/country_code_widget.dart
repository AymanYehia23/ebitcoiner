import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class CustomCountryCode extends StatelessWidget {
  const CustomCountryCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      height: s.h(60),
      decoration: BoxDecoration(
        color: const Color(0xff302c3f),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(s.h(10)),
      ),
      child: CountryCodePicker(
        textStyle: Theme.of(context).textTheme.bodyText2,
        initialSelection: 'eg',
        dialogBackgroundColor: const Color(0xff13111a).withOpacity(0.8),
        dialogSize: Size(s.w(250), s.h(600)),
        dialogTextStyle: Theme.of(context).textTheme.bodyText2,
        searchDecoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyText2,
          fillColor: Colors.white54,
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
        ),
      ),
    );
  }
}
