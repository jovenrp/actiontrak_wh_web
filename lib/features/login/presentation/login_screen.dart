import 'package:actiontrak_wh/application/utils/app_colors.dart';

// ignore: unused_import
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:actiontrak_wh/features/login/bloc/login_state.dart';
import 'package:actiontrak_wh/features/login/presentation/login_web_view.dart';
import 'package:actiontrak_wh/features/navigation/presentation/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../application/widgets/buttons/custom_button.dart';
import '../../../application/widgets/dialogs/custom_dialog.dart';
import '../../../application/widgets/images/custom_logo.dart';
import '../../../application/widgets/loader/spinner_loader.dart';
import '../../../application/widgets/textfields/custom_textfield.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';
  static const String screenName = 'loginScreen';

  static ModalRoute<LoginScreen> route({String? user}) => MaterialPageRoute<LoginScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const LoginScreen(),
      );

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late double height;
  late double width;
  TextEditingController username = TextEditingController(), password = TextEditingController();

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
  }

  getPackage() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    getPackage();

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (!state.isLoading) {
          if (!state.loginStatus) {
            if (context.mounted) {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    type: IconType.error,
                    title: 'Failed',
                    content: state.loginMessage,
                    confirmButtonText: 'Done',
                    onConfirm: () {
                      //Navigator.of(context).pop();
                    },
                  );
                },
              );
            }
          } else {
            if (context.mounted) {
              Navigator.of(context).pop();
              Navigator.of(context).push(NavigationBottomBar.route(user: username.text));
            }
          }
        }
      },
      builder: (BuildContext context, LoginState state) {
        return UniversalPlatform.isWeb
            ? LoginWebView(
                width: width,
                height: height,
                username: username,
                password: password,
                onTap: () {
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          type: IconType.info,
                          title: 'Login',
                          content: 'Logging in, Please wait.',
                          confirmButtonText: 'Cancel',
                          extraWidget: const Center(
                            child: SpinnerLoader(
                              backgroundColor: AppColors.primary,
                              strokeWidth: 50,
                            ),
                          ),
                          noButton: true,
                          onConfirm: () {
                            //Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  }

                  if (context.mounted) {
                    Navigator.of(context).push(NavigationBottomBar.route(user: username.text));
                    //context.read<LoginBloc>().login(username.text, password.text);
                  }
                },
                packageInfo: packageInfo,
              )
            : Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .2,
                        ),
                        const CustomLogo(),
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
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  color: AppColors.background,
                  height: MediaQuery.of(context).size.height * .2,
                  child: Column(
                    children: [
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  type: IconType.info,
                                  title: 'Login',
                                  content: 'Logging in, Please wait.',
                                  confirmButtonText: 'Cancel',
                                  extraWidget: const Center(
                                    child: SpinnerLoader(
                                      backgroundColor: AppColors.primary,
                                      strokeWidth: 50,
                                    ),
                                  ),
                                  noButton: true,
                                  onConfirm: () {
                                    //Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          }

                          if (context.mounted) {
                            context.read<LoginBloc>().login(username.text, password.text);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: 'v${packageInfo.version}+${packageInfo.buildNumber}',
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
