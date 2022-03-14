import 'package:flutter/material.dart';

import 'package:hash_store/presentation/sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {
  final String text;
  final double wid;
  const DefaultTextField({
    Key? key,
    required this.text,
    required this.wid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Column(
      children: [
        Theme(
          data: ThemeData(

          ),
          child: TextField(
            decoration: InputDecoration(
              fillColor: const Color(0xff302c3f),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: s.w(wid),
                  color: const Color(0xffe6e6e6),
                ),
                borderRadius: BorderRadius.all(Radius.circular(s.h(8.0))),
              ),
              hintText: text,
              hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: s.h(19.0),
                  ),
            ),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: s.h(19.0),
                ),
          ),
        ),
      ],
    );
  }
}
