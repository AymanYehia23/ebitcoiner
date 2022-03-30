import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_small_button.dart';
import 'package:sizer/sizer.dart';


class ChooseDesiredPlanWidget extends StatefulWidget {
  final String price;
  final String minersPic;
  final String text;
  final String currencyIcn;
  final String currencyName;
  final String power;
  final String pricePer1Gh;
  final String profitability;
  const ChooseDesiredPlanWidget({
    Key? key,
    required this.price,
    required this.minersPic,
    required this.text,
    required this.currencyIcn,
    required this.currencyName,
    required this.power,
    required this.pricePer1Gh,
    required this.profitability,
  }) : super(key: key);

  @override
  State<ChooseDesiredPlanWidget> createState() =>
      _ChooseDesiredPlanWidgetState();
}

class _ChooseDesiredPlanWidgetState extends State<ChooseDesiredPlanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular((8.0)),
      ),
      child: Column(
        children: [
          Container(
            height: 9.h,
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.minersPic,
                  height: 17.w,
                  width: 17.w,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mining Currency',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            widget.currencyIcn,
                            height: 5.w,
                            width: 5.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            widget.currencyName,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13.sp,
                                    ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Power',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.power,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                            ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price Per 1 GH/S',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.pricePer1Gh,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                            ),
                      ),
                    ]),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Profitability',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.profitability,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                            ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        widget.price,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: DefaultGradientSmallButton(onPressed: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
