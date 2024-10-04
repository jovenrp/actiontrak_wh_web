import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/features/login/presentation/login_screen.dart';
import 'package:actiontrak_wh/features/navigation/presentation/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/widgets/images/custom_logo.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';
  static const String screenName = 'splashScreen';

  static ModalRoute<SplashScreen> route() => MaterialPageRoute<SplashScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen(),
      );

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  late double width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SplashBloc>().loadSplashScreen();

  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<SplashBloc, SplashState>(listener: (BuildContext context, SplashState state) {
      if (!state.isLoading) {
        if (!state.isLoggedIn) {
          Navigator.of(context).pushReplacement(
            LoginScreen.route(),
          );
        } else {
          Navigator.of(context).pushReplacement(
            NavigationBottomBar.route(user: state.user),
          );
        }


      }
    }, builder: (BuildContext context, SplashState state) {
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomLogo(showTitle: false,),
            SizedBox(height: 20,),
            Center(
              child: SpinnerLoader(backgroundColor: AppColors.primary,),
            )
          ],
        ),
      );
    });
  }
}
