import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class AddNewHashrateWidget extends StatefulWidget {
  const AddNewHashrateWidget({ Key? key }) : super(key: key);

  @override
  State<AddNewHashrateWidget> createState() => _AddNewHashrateWidgetState();
}

class _AddNewHashrateWidgetState extends State<AddNewHashrateWidget> {
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: s.w(8.0),vertical: s.h(8.0)),
              height: s.h(38.0),
              width: double.infinity,
              child: Text(
                'Contract period',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: s.h(17.0),
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          Container(
            height: s.h(77),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: s.w(16.0),
              vertical: s.h(8.0),
            ),
            child: Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: s.h(19.0)),
                      width: s.w(166.5),
                      height: s.h(61.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff302c3f),
                        borderRadius: BorderRadius.circular(
                          s.h(8.0),
                        ),
                      ),
                      child: Text(
                        '30 days',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(18.0),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: s.w(10.0),),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: s.w(166.5),
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
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '12% Off',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: s.h(14.0),
                                  color: const Color(0xffff4980),
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: s.h(77),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: s.w(16.0),
              vertical: s.h(8.0),
            ),
            child: Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: s.w(166.5),
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
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}