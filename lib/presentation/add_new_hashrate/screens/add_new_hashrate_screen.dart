import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/add_new_hashrate/widgets/add_new_hashrate_widget.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class AddNewHashrateScreen extends StatefulWidget {
  const AddNewHashrateScreen({Key? key}) : super(key: key);

  @override
  State<AddNewHashrateScreen> createState() => _AddNewHashrateScreenState();
}

class _AddNewHashrateScreenState extends State<AddNewHashrateScreen> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close_rounded, color: Colors.white),
            alignment: Alignment.topRight,
          )
        ],
        title: Title(
          child: Text(
            'Add New HashRate Plan',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: s.h(17.0)),
            textAlign: TextAlign.center,
          ),
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height:
                _isExpanded1 || _isExpanded2 || _isExpanded3 ? s.h(485) : s.h(282),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff1d1a27),
              border: Border(
                bottom: BorderSide(
                  width: 0.7,
                  color: Colors.white,
                ),
              ),
            ),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: s.h(8.0)),
                height: s.h(38.0),
                width: double.infinity,
                child: Text(
                  'Choose Currency',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: s.h(17.0),
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: s.w(16.0), vertical: s.h(8.0)),
                height: s.h(64.0),
                width: double.infinity,
                child: Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/btc_icon.svg',
                        height: s.h(32),
                        width: s.h(32.0),
                      ),
                      SizedBox(
                        width: s.w(4.0),
                      ),
                      Text(
                        'BTC (Bitcoin)',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: s.h(17.0)),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isExpanded1 = !_isExpanded1;
                            _isExpanded2=false;
                            _isExpanded3=false;
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
              ),
              if (_isExpanded1) const AddNewHashrateWidget(),
               const Divider(color: Colors.grey),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: s.w(16.0), vertical: s.h(16.0)),
                height: s.h(64.0),
                width: double.infinity,
                child: Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/eth_icon.svg',
                        height: s.h(32),
                        width: s.h(32.0),
                      ),
                      SizedBox(
                        width: s.w(4.0),
                      ),
                      Text(
                        'Eth (Ethereum)',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: s.h(17.0)),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isExpanded2 = !_isExpanded2;
                            _isExpanded1=false;
                            _isExpanded3=false;
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
              ),
              if (_isExpanded2) const AddNewHashrateWidget(),
              
              const Divider(color: Colors.grey),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: s.w(16.0), vertical: s.h(16.0)),
                height: s.h(64.0),
                width: double.infinity,
                child: Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/rvn_icon.svg',
                        height: s.h(32),
                        width: s.h(32.0),
                      ),
                      SizedBox(
                        width: s.w(4.0),
                      ),
                      Text(
                        'RVN (Raven)',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: s.h(17.0)),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isExpanded3 = !_isExpanded3;
                            _isExpanded1=false;
                            _isExpanded2=false;
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
              ),
              if (_isExpanded3) const AddNewHashrateWidget(),
            ]),
          ),
          SizedBox(
            height: _isExpanded1 || _isExpanded2 || _isExpanded3? s.h(196.0):s.h(388.0),
          ),
          const DefaultDisabledButton(text: Text('Next')),
        ],
      ),
    );
  }
}
