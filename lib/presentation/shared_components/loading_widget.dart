import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.darkWhite,
      ),
    );
  }
}
