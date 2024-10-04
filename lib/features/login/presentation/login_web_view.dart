import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';

import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../application/widgets/buttons/custom_button.dart';
import '../../../application/widgets/images/custom_logo.dart';
import '../../../application/widgets/textfields/custom_textfield.dart';

class LoginWebView extends StatelessWidget {
  const LoginWebView({
    super.key,
    this.width = 0,
    this.height = 0,
    required this.username,
    required this.password,
    this.onTap,
    this.packageInfo,
  });

  final double width, height;
  final TextEditingController username, password;
  final VoidCallback? onTap;
  final PackageInfo? packageInfo;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          width: width * .4,
          height: height * .5,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomHeader(
                      text: 'Enter Login Details',
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: username,
                      hintText: 'Username',
                      icon: Icons.person,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: password,
                      hintText: 'Password',
                      icon: Icons.password,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      text: 'Login',
                      onPressed: onTap ?? (){},
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomLogo(),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'v${packageInfo?.version}+${packageInfo?.buildNumber}',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
