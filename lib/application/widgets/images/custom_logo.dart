// ignore: unused_import
import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../texts/custom_header.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, this.showTitle = false});

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/png/logo.png', width: 130,),
        Visibility(
          visible: showTitle,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: const CustomHeader(
              text: 'ActionTRAK',
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
