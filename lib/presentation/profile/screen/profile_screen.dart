import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/strings.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Strings.profile,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 60),
      ),
    );
  }
}
