import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_small_button.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

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
    Sizer s = Sizer(context: context);
    return Container(
      height: s.h(314.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular(s.w(8.0)),
      ),
      child: Column(
        children: [
          Container(
            height: s.h(84.0),
            padding: EdgeInsets.symmetric(
              horizontal: s.w(16.0),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.minersPic,
                  height: s.h(56.0),
                  width: s.h(56.0),
                ),
                SizedBox(
                  width: s.w(8.0),
                ),
                Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(17.0),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(5.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            widget.currencyIcn,
                            height: s.h(20.0),
                            width: s.h(20.0),
                          ),
                          SizedBox(
                            width: s.w(4.0),
                          ),
                          Text(
                            widget.currencyName,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(17.0),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.power,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
                            ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: s.h(16),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.pricePer1Gh,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.profitability,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
                            ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: s.h(16),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: s.w(16),vertical: s.h(16)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4.0),
                      ),
                      Text(
                        widget.price,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(30.0),
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
