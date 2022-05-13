import 'package:flutter/material.dart';
import 'package:hash_store/presentation/profile/widgets/change_password_widget.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

class PasswordInfoWidget extends StatelessWidget {
  final String password;
  const PasswordInfoWidget({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      width: double.infinity,
      height: (22.h),
      color: const Color(0xff1d1a27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Password',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              password,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.sp,
                  ),
            ),
          ),
          Expanded(
            child: DefaultGradientButton(
              height: 6.h,
              isFilled: false,
              text: Text(
                'Change Password',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12.sp,
                    ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const ChangePasswordWidget(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
