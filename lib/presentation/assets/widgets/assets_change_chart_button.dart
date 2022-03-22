import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class AssetsChangeChartButton extends StatelessWidget {
  const AssetsChangeChartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
      width: double.infinity,
      height: s.h(48),
      color: const Color(0xff1d1a27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              context.read<AssetsCubit>().getChartData(Currency.btc);
            },
            child: Container(
              width: s.w(78),
              height: s.h(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(s.h(20)),
                color: context.watch<AssetsCubit>().currency == Currency.btc
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Strings.btcIcon,
                    width: s.h(24),
                    height: s.h(24),
                  ),
                  SizedBox(
                    width: s.w(4),
                  ),
                  Text(
                    'BTC',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(15),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<AssetsCubit>().getChartData(Currency.eth);
            },
            child: Container(
              width: s.w(78),
              height: s.h(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(s.h(20)),
                color: context.watch<AssetsCubit>().currency == Currency.eth
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Strings.ethIcon,
                    width: s.h(24),
                    height: s.h(24),
                  ),
                  SizedBox(
                    width: s.w(4),
                  ),
                  Text(
                    'ETH',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(15),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<AssetsCubit>().getChartData(Currency.rvn);
            },
            child: Container(
              width: s.w(78),
              height: s.h(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(s.h(20)),
                color: context.watch<AssetsCubit>().currency == Currency.rvn
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Strings.rvnIcon,
                    width: s.h(28),
                    height: s.h(28),
                  ),
                  SizedBox(
                    width: s.w(4),
                  ),
                  Text(
                    'RVN',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(15),
                          fontWeight: FontWeight.bold,
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
