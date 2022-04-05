import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:sizer/sizer.dart';

class ExpiredPlansWidget extends StatefulWidget {
  const ExpiredPlansWidget({Key? key}) : super(key: key);

  @override
  State<ExpiredPlansWidget> createState() => _ExpiredPlansWidgetState();
}

class _ExpiredPlansWidgetState extends State<ExpiredPlansWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      height: _isExpanded ? 40.h : 9.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expired plans (4)',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: const Color(0xff302c3f),
                    borderRadius: BorderRadius.circular(
                      (32),
                    ),
                  ),
                  child: SvgPicture.asset(
                    Strings.featherChevronDownIcon,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
