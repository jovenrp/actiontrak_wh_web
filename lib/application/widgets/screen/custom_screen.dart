import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../appbar/custom_appbar.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  static const String routeName = '/customScreen';
  static const String screenName = 'customScreenScreen';

  static ModalRoute<CustomScreen> route() => MaterialPageRoute<CustomScreen>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => const CustomScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.primaryContrast,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes the shadow position
                ),
              ],
            ),
            child: Image.asset('assets/images/png/gcash_jovenrp.png'),
          ),
        ),
      ),
    );
  }
}
