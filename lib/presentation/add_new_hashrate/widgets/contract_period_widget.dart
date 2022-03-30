import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';


class ContractPeriodWidget extends StatefulWidget {
  ContractPeriodWidget({
    Key? key,
    required this.isSelected1,
    required this.isSelected2,
    required this.isSelected3,
    required this.onTapInkWell1,
    required this.onTapButton1,
    required this.onTapInkWell2,
    required this.onTapButton2,
    required this.onTapInkWell3,
    required this.onTapButton3,
  }) : super(key: key);
  bool isSelected1;
  bool isSelected2;
  bool isSelected3;
  Function onTapInkWell1;
  Function onTapButton1;
  Function onTapInkWell2;
  Function onTapButton2;
  Function onTapInkWell3;
  Function onTapButton3;
  @override
  State<ContractPeriodWidget> createState() => _ContractPeriodWidgetState();
}

class _ContractPeriodWidgetState extends State<ContractPeriodWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        children: [
          Text(
            'Contract period',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Expanded(
                child: !widget.isSelected1
                    ? InkWell(
                        onTap: widget.onTapInkWell1(),
                        child: Container(
                          height: 6.5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xff302c3f),
                            borderRadius: BorderRadius.circular(
                              (8.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '30 days',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      )
                    : DefaultGradientButton(
                        hight: 6.5.h,
                        radius: (8),
                        isFilled: false,
                        text: Text(
                          '30 days',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: widget.onTapButton1,
                      ),
              ),
              SizedBox(
                width: 1.5.w,
              ),
              Expanded(
                child: !widget.isSelected2
                    ? InkWell(
                        onTap: widget.onTapInkWell2(),
                        child: Container(
                          height: 6.5.h,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '12% Off',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      color: const Color(0xffff4980),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : DefaultGradientButton(
                        hight: 6.5.h,
                        radius: (8),
                        isFilled: false,
                        text: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '360 days',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '12% Off',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize:10.sp,
                                    color: const Color(0xffff4980),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: widget.onTapButton2,
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Expanded(
                child: !widget.isSelected3
                    ? InkWell(
                        onTap: widget.onTapInkWell3(),
                        child: Container(
                          height: 6.5.h,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '40% Off',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      color: const Color(0xffff4980),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : DefaultGradientButton(
                        hight: 6.5.h,
                        radius: (8),
                        isFilled: false,
                        text: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '3 Years',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '40% Off',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 10.sp,
                                    color: const Color(0xffff4980),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: widget.onTapButton3,
                      ),
              ),
              const Expanded(
                child: Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
