import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

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
    Sizer s = Sizer(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.w(16), vertical: s.h(8)),
      child: Column(
        children: [
          Text(
            'Contract period',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: s.h(17.0),
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: s.h(16),
          ),
          Row(
            children: [
              Expanded(
                child: !widget.isSelected1
                    ? InkWell(
                        onTap: widget.onTapInkWell1(),
                        child: Container(
                          height: s.h(61.0),
                          decoration: BoxDecoration(
                            color: const Color(0xff302c3f),
                            borderRadius: BorderRadius.circular(
                              s.h(8.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '30 days',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(18.0),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      )
                    : DefaultGradientButton(
                        hight: s.h(61),
                        radius: s.h(8),
                        isFilled: false,
                        text: Text(
                          '30 days',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(18.0),
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: widget.onTapButton1,
                      ),
              ),
              SizedBox(
                width: s.w(10.0),
              ),
              Expanded(
                child: !widget.isSelected2
                    ? InkWell(
                        onTap: widget.onTapInkWell2(),
                        child: Container(
                          height: s.h(61.0),
                          decoration: BoxDecoration(
                            color: const Color(0xff302c3f),
                            borderRadius: BorderRadius.circular(
                              s.h(8.0),
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
                                      fontSize: s.h(18.0),
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
                                      fontSize: s.h(14.0),
                                      color: const Color(0xffff4980),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : DefaultGradientButton(
                        hight: s.h(61),
                        radius: s.h(8),
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
                                    fontSize: s.h(18.0),
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
                                    fontSize: s.h(14.0),
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
            height: s.h(16),
          ),
          Row(
            children: [
              Expanded(
                child: !widget.isSelected3
                    ? InkWell(
                        onTap: widget.onTapInkWell3(),
                        child: Container(
                          height: s.h(61.0),
                          decoration: BoxDecoration(
                            color: const Color(0xff302c3f),
                            borderRadius: BorderRadius.circular(
                              s.h(8.0),
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
                                      fontSize: s.h(18.0),
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
                                      fontSize: s.h(14.0),
                                      color: const Color(0xffff4980),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : DefaultGradientButton(
                        hight: s.h(61),
                        radius: s.h(8),
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
                                    fontSize: s.h(18.0),
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
                                    fontSize: s.h(14.0),
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
