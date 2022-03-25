import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class ExpiredPlansWidget extends StatefulWidget {
  const ExpiredPlansWidget({Key? key}) : super(key: key);

  @override
  State<ExpiredPlansWidget> createState() => _ExpiredPlansWidgetState();
}

class _ExpiredPlansWidgetState extends State<ExpiredPlansWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: s.w(16.0),
        vertical: s.h(16.0),
      ),
      height: _isExpanded ? s.h(313) : s.h(60.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(s.w(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  'Expired plans (4)',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(17.0),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                 const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    width: s.h(32),
                    height: s.h(32),
                    decoration: BoxDecoration(
                      color: const Color(0xff302c3f),
                      borderRadius: BorderRadius.circular(
                        s.h(32),
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
        ],
      ),
    );
  }
}
