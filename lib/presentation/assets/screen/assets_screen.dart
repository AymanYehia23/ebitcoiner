import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../widgets/assets_header_widget.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
          child: Column(
            children: [
              AssetsHeaderWidget(s: s),
              
            ],
          ),
        ),
      ),
    );
  }
}
