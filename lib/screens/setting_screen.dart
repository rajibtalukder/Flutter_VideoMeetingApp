import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomButton(
          text: 'Log Out',
          onPressed: () {
            AuthMethods().logOut();
            Navigator.pushNamed(context, '/login');
          }),
    );
  }
}