import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class YourMinersWidget extends StatelessWidget {
  final String yourMinerPic;
  final String currencyIcn;
  final String currency;
  final String antMiner;
  final String maintenanceStart;
  final String maintenanceEnd;
  final String maintenancePrice;
  final String profit;
  final bool isEnd;
  final bool closeToEnd;

  const YourMinersWidget({
    Key? key,
    required this.yourMinerPic,
    required this.currencyIcn,
    required this.currency,
    required this.antMiner,
    required this.maintenanceStart,
    required this.maintenanceEnd,
    required this.maintenancePrice,
    required this.profit,
    required this.isEnd,
    required this.closeToEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    const String endSupport =
        'Device support stopped, please renew\n maintenance support to re-activate the device';
    return closeToEnd
        ? Container(
            height: s.h(371.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1d1a27),
              border: Border.all(
                color: Colors.red,
              ),
            ),
            child: Column(
              children: [
                Container(
                  color: const Color.fromRGBO(240, 61, 62, 0.1),
                  height: s.h(40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: s.w(5.0),
                      ),
                      Text(
                        isEnd
                            ? endSupport
                            : 'Maintenance support will end on $maintenanceEnd',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(12.0),
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s.w(16.0), vertical: s.h(16.0)),
                  height: s.h(92.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        yourMinerPic,
                        height: s.h(64.0),
                        width: s.h(60.0),
                      ),
                      SizedBox(
                        width: s.w(12.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            antMiner,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(19.0),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: s.h(7.0),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                currencyIcn,
                                height: s.h(24.0),
                                width: s.h(24.0),
                              ),
                              SizedBox(
                                width: s.w(8.0),
                              ),
                              Text(
                                currency,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: s.h(16.0),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Device Bought on: $maintenanceStart',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(16.0),
                      ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Start',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              maintenanceStart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance End',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              maintenanceEnd,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              maintenancePrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              profit,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: s.h(56.0),
                  padding: EdgeInsets.symmetric(horizontal: s.w(16)),
                  child: DefaultGradientButton(
                      isFilled: true,
                      text: Text(
                        'Renew maintenance support',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(19.0),
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                  height: s.h(16),
                ),
              ],
            ),
          )
        : Container(
            height: isEnd ? s.h(350.0) : s.h(240.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1d1a27),
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(s.w(8.0)),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s.w(16.0), vertical: s.h(16.0)),
                  height: s.h(92.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        yourMinerPic,
                        height: s.h(64.0),
                        width: s.h(60.0),
                      ),
                      SizedBox(
                        width: s.w(12.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            antMiner,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(19.0),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: s.h(7.0),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                currencyIcn,
                                height: s.h(24.0),
                                width: s.h(24.0),
                              ),
                              SizedBox(
                                width: s.w(8.0),
                              ),
                              Text(
                                currency,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: s.h(16.0),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Start',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              maintenanceStart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance End',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              maintenanceEnd,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              maintenancePrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: s.h(71.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(15.0),
                                  ),
                            ),
                            SizedBox(
                              height: s.h(4.0),
                            ),
                            Text(
                              profit,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(17.0),
                                  ),
                            )
                          ],
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
