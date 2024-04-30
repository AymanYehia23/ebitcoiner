import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/presentation/profile/widgets/delete_account_widget.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

class PersonalInfoWidget extends StatelessWidget {
  final String email;
  final String phoneNum;
  const PersonalInfoWidget({
    Key? key,
    required this.email,
    required this.phoneNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      height: (26.h),
      color: ColorManager.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Personal information',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.person,
                    size: (1.h * 2.w),
                    color: ColorManager.gray,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: ColorManager.gray,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              email,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_android,
                            color: ColorManager.gray,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              phoneNum,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: DefaultGradientButton(
                isFilled: false,
                height: 6.h,
                text: Text(
                  'Delete Account',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12.sp,
                      ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const DeleteAccountWidget(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
