import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/add_new_hashrate/widgets/contract_period_widget.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';

class AddNewHashrateScreen extends StatefulWidget {
  const AddNewHashrateScreen({Key? key}) : super(key: key);

  @override
  State<AddNewHashrateScreen> createState() => _AddNewHashrateScreenState();
}

class _AddNewHashrateScreenState extends State<AddNewHashrateScreen> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff13111a),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close_rounded, color: Colors.white),
        ),
        title: Title(
          child: Text(
            'Add New Hashrate Plan',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 13.sp),
          ),
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 1.h),
              height: 5.h,
              width: double.infinity,
              color: const Color(0xff1d1a27),
              child: Text(
                'Choose Currency',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff1d1a27),
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade800),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    height: 7.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/btc_icon.svg',
                          height: (4.h),
                          width: (4.w),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'BTC (Bitcoin)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isExpanded1 = !_isExpanded1;
                              _isExpanded2 = false;
                              _isExpanded3 = false;
                            });
                          },
                          child: Container(
                            width: (9.w),
                            height: (9.w),
                            decoration: BoxDecoration(
                              color: const Color(0xff302c3f),
                              borderRadius: BorderRadius.circular(
                                (32),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/feather_chevron_down_icon.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_isExpanded1)
                    ContractPeriodWidget(
                      isSelected1: isSelected1,
                      isSelected2: isSelected2,
                      isSelected3: isSelected3,
                      onTapInkWell1: () => () {
                        setState(() {
                          isSelected1 = true;
                          isSelected2 = false;
                          isSelected3 = false;
                        });
                      },
                      onTapButton1: () {
                        setState(() {
                          isSelected1 = false;
                        });
                      },
                      onTapInkWell2: () => () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = true;
                          isSelected3 = false;
                        });
                      },
                      onTapButton2: () {
                        setState(() {
                          isSelected2 = false;
                        });
                      },
                      onTapInkWell3: () => () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = false;
                          isSelected3 = true;
                        });
                      },
                      onTapButton3: () {
                        setState(() {
                          isSelected3 = false;
                        });
                      },
                    ),
                  Divider(color: Colors.grey.shade800),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    height: 7.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/eth_icon.svg',
                          height: 4.h,
                          width: 4.w,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'Eth (Ethereum)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isExpanded2 = !_isExpanded2;
                              _isExpanded1 = false;
                              _isExpanded3 = false;
                            });
                          },
                          child: Container(
                            width: (9.w),
                            height: (9.w),
                            decoration: BoxDecoration(
                              color: const Color(0xff302c3f),
                              borderRadius: BorderRadius.circular(
                                (32),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/feather_chevron_down_icon.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_isExpanded2)
                    ContractPeriodWidget(
                      isSelected1: isSelected1,
                      isSelected2: isSelected2,
                      isSelected3: isSelected3,
                      onTapInkWell1: () => () {
                        setState(() {
                          isSelected1 = true;
                          isSelected2 = false;
                          isSelected3 = false;
                        });
                      },
                      onTapButton1: () {
                        setState(() {
                          isSelected1 = false;
                        });
                      },
                      onTapInkWell2: () => () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = true;
                          isSelected3 = false;
                        });
                      },
                      onTapButton2: () {
                        setState(() {
                          isSelected2 = false;
                        });
                      },
                      onTapInkWell3: () => () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = false;
                          isSelected3 = true;
                        });
                      },
                      onTapButton3: () {
                        setState(() {
                          isSelected3 = false;
                        });
                      },
                    ),
                  Divider(color: Colors.grey.shade800),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    height: 7.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/rvn_icon.svg',
                          height: 4.5.h,
                          width: 5.w
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'RVN (Raven)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isExpanded3 = !_isExpanded3;
                              _isExpanded1 = false;
                              _isExpanded2 = false;
                            });
                          },
                          child: Container(
                            width: (9.w),
                            height: (9.w),
                            decoration: BoxDecoration(
                              color: const Color(0xff302c3f),
                              borderRadius: BorderRadius.circular(
                                (32),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/feather_chevron_down_icon.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_isExpanded3)
                    ContractPeriodWidget(
                      isSelected1: isSelected1,
                      isSelected2: isSelected2,
                      isSelected3: isSelected3,
                      onTapInkWell1: () => () {
                        setState(() {
                          isSelected1 = true;
                          isSelected2 = false;
                          isSelected3 = false;
                        });
                      },
                      onTapButton1: () {
                        setState(() {
                          isSelected1 = false;
                        });
                      },
                      onTapInkWell2: () => () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = true;
                          isSelected3 = false;
                        });
                      },
                      onTapButton2: () {
                        setState(() {
                          isSelected2 = false;
                        });
                      },
                      onTapInkWell3: () => () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = false;
                          isSelected3 = true;
                        });
                      },
                      onTapButton3: () {
                        setState(() {
                          isSelected3 = false;
                        });
                      },
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: isSelected1 || isSelected2 || isSelected3
                  ? DefaultGradientButton(
                      isFilled: true,
                      text: Text(
                        'Next',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRouter.chooseDesiredPlan);
                      },
                    )
                  : DefaultDisabledButton(
                      text: Text(
                        'Next',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
