import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Devices',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 60),
      ),
    );
  }
}
