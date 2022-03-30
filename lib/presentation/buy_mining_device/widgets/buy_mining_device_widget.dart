import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class BuyMiningDeviceWidget extends StatefulWidget {
  final String yourMinerPic;
  final String yourMinerName;
  final String currencyIcn1;
  final String currencyName1;
  final String currencyIcn2;
  final String currencyName2;
  final String algorithm;
  final String profitability;
  final String power;
  final String unitPrice;
  final String maintenancePrice;
  const BuyMiningDeviceWidget({
    Key? key,
    required this.yourMinerPic,
    required this.yourMinerName,
    required this.currencyIcn1,
    required this.currencyIcn2,
    required this.currencyName1,
    required this.currencyName2,
    required this.algorithm,
    required this.profitability,
    required this.power,
    required this.unitPrice,
    required this.maintenancePrice,
  }) : super(key: key);

  @override
  State<BuyMiningDeviceWidget> createState() => _BuyMiningDeviceWidgetState();
}

class _BuyMiningDeviceWidgetState extends State<BuyMiningDeviceWidget> {
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      height: s.h(420.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(s.h(8.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
            height: s.h(84.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  widget.yourMinerPic,
                  height: s.h(52.0),
                  width: s.w(56.0),
                ),
                SizedBox(
                  width: s.w(8.0),
                ),
                Text(
                  widget.yourMinerName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(19.0),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: s.h(100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mining Currency',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4.5),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            widget.currencyIcn1,
                            height: s.h(20.0),
                            width: s.w(20.0),
                          ),
                          SizedBox(
                            width: s.w(4.0),
                          ),
                          Text(
                            widget.currencyName1,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(17.0),
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: s.h(7.0),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            widget.currencyIcn2,
                            height: s.h(20.0),
                            width: s.w(20.0),
                          ),
                          SizedBox(
                            width: s.w(4.0),
                          ),
                          Text(
                            widget.currencyName2,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(17.0),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: s.h(100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Algorithm',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4.5),
                      ),
                      Text(
                        widget.algorithm,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: s.h(71.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Power',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        width: s.w(4.0),
                      ),
                      Text(
                        widget.power,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
                            ),
                      ),
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
                        'Profitability',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4.0),
                      ),
                      Text(
                        widget.profitability,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: s.w(16.0), vertical: s.h(16.0)),
            height: s.h(157.0),
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    height: s.h(87.0),
                    child: Column(children: [
                      Text(
                        'Unit Price',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4.0),
                      ),
                      Text(
                        widget.unitPrice,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(30.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: s.h(87.0),
                    child: Column(children: [
                      Text(
                        'Maintenance Price',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4.0),
                      ),
                      Text(
                        widget.maintenancePrice,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(30.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: s.h(54.0),
                child: DefaultGradientButton(
                  isFilled: true,
                  text: Text(
                    'Buy Device',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(19.0),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
