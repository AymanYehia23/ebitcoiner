import 'package:flutter/material.dart';

class HashRateScreen extends StatelessWidget {
  const HashRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'HashRate',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 60),
      ),
    );
  }
}
