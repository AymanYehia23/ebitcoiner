import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class ContractPeriodWidget extends StatefulWidget {
  const ContractPeriodWidget({Key? key}) : super(key: key);

  @override
  State<ContractPeriodWidget> createState() => _ContractPeriodWidgetState();
}

class _ContractPeriodWidgetState extends State<ContractPeriodWidget> {
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return SizedBox(
      height: s.h(61.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: s.w(136),
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
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(18.0),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: s.w(10.0),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: s.w(136),
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
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(18.0),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '12% Off',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(14.0),
                          color: const Color(0xffff4980),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: s.w(10.0),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: s.w(136),
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
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(18.0),
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '40% Off',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(14.0),
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
