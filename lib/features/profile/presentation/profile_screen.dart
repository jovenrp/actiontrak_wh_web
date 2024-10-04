import 'package:actiontrak_wh/application/widgets/cards/profile_card.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:actiontrak_wh/features/login/presentation/login_screen.dart';
import 'package:actiontrak_wh/features/profile/bloc/profile_bloc.dart';
import 'package:actiontrak_wh/features/profile/bloc/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/utils/app_colors.dart';
import '../../../application/widgets/buttons/custom_button_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.user});

  final String? user;

  static const String routeName = '/profile';
  static const String screenName = 'profileScreen';

  static ModalRoute<ProfileScreen> route({String? user}) => MaterialPageRoute<ProfileScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProfileScreen(
          user: user,
        ),
      );

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool pickLimitSetting = false;

  @override
  void initState() {
    context.read<ProfileBloc>().checkSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (BuildContext context, ProfileState state) {
        if (!state.isLoading) {
          pickLimitSetting = state.pickLimitSetting;
        }
      },
      builder: (BuildContext context, ProfileState state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                ProfileContainer(
                  name: '${widget.user}',
                  imageUrl: 'https://www.example.com/profile-image.jpg',
                  bio: '${widget.user}',
                  backgroundColor: Colors.white,
                  borderRadius: 16.0,
                  padding: 16.0,
                ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.unfold_more_double_outlined),
                      const SizedBox(width: 20,),
                      const CustomHeader(
                        text: 'Exceed Pick Limit',
                        color: AppColors.textColor,
                        fontSize: 14,
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                          value: pickLimitSetting,
                          onChanged: (bool value) {
                            setState(() {
                              pickLimitSetting = !pickLimitSetting;
                              context
                                  .read<ProfileBloc>()
                                  .togglePickLimitSetting(pickLimitSetting);
                            });
                          }),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButtonContainer(
                  text: 'Sign Out',
                  icons: Icons.logout_outlined,
                  onPressed: (){
                    context
                        .read<ProfileBloc>()
                        .logout().then((value) {
                          if (context.mounted) {
                            Navigator.of(context).pushReplacement(
                              LoginScreen.route(),
                            );
                          }
                    });
                  },
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        );
      },
    );
  }
}
