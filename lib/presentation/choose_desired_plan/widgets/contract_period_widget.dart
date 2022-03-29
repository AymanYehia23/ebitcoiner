import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContractPeriodWidget extends StatefulWidget {
  const ContractPeriodWidget({Key? key}) : super(key: key);

  @override
  State<ContractPeriodWidget> createState() => _ContractPeriodWidgetState();
}

class _ContractPeriodWidgetState extends State<ContractPeriodWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 9.h,
              decoration: BoxDecoration(
                color: const Color(0xff302c3f),
                borderRadius: BorderRadius.circular(
                  (8.0),
                ),
              ),
              child: Center(
                child: Text(
                  '30 days',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 9.h,
              decoration: BoxDecoration(
                color: const Color(0xff302c3f),
                borderRadius: BorderRadius.circular(
                  (8.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '360 days',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '12% Off',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 10.sp,
                          color: const Color(0xffff4980),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 9.h,
              decoration: BoxDecoration(
                color: const Color(0xff302c3f),
                borderRadius: BorderRadius.circular(
                  (8.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '3 Years',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '40% Off',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 10.sp,
                          color: const Color(0xffff4980),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
