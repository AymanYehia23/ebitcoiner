import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:sizer/sizer.dart';
import 'buy_mining_device_widget.dart';

class PayForBuyDevice extends StatelessWidget {
  final String yourMinerPic;
  final String yourMinerName;
  final String yourMinerRate;
  const PayForBuyDevice({
    Key? key,
    required this.yourMinerPic,
    required this.yourMinerName,
    required this.yourMinerRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
      color: const Color(0xff1d1a27),
      child: Column(children: [
        Image(
          height: 7.h,
          width: 7.h,
          image: AssetImage(yourMinerPic),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          yourMinerName,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 13.5.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 0.25.h,
        ),
        Text(
          yourMinerRate,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 12.5.sp,
                color: const Color.fromRGBO(255, 73, 128, 1),
              ),
        ),
        SizedBox(
          height: 2.h,
        ),
        const DefaultTextField(text: 'Card Number'),
        SizedBox(
          height: 2.h,
        ),
        const DefaultTextField(text: 'Name on card'),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            const Expanded(
              child: DefaultTextField(text: 'Expiry Date'),
            ),
            SizedBox(width: 4.w),
            const Expanded(
              child: DefaultTextField(text: 'CVV'),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        DefaultGradientButton(
          isFilled: true,
          text: Text(
            'Buy Now',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
          ),
          onPressed: () {},
        ),
      ]),
    );
  }
}
