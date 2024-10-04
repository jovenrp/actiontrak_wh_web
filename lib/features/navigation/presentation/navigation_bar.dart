import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/features/dashboard/presentation/dashboard_screen.dart';
import 'package:actiontrak_wh/features/navigation/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/navigation/bloc/dashboard_state.dart';
import 'package:actiontrak_wh/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key, this.user});

  final String? user;

  static const String routeName = '/navigationBottomBar';
  static const String screenName = 'navigationBottomBarScreen';

  static ModalRoute<NavigationBottomBar> route({String? user}) => MaterialPageRoute<NavigationBottomBar>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => NavigationBottomBar(
          user: user,
        ),
      );

  @override
  NavigationBottomBarState createState() => NavigationBottomBarState();
}

class NavigationBottomBarState extends State<NavigationBottomBar> {
  int _currentIndex = 0; // Track the selected tab index
  late double width;
  late double height;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<DashboardBloc>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (BuildContext context, NavigationState state) {},
      builder: (BuildContext context, NavigationState state) {
        return Scaffold(
          body: IndexedStack(
            index: _currentIndex, // Shows the selected page
            children: [
              DashboardScreen(
                user: widget.user,
              ),
              ProfileScreen(user: widget.user),
              //SalesScreen(user: state.user,),
              //InventoryScreen(user: state.user,),
              //ProfileScreen(user: state.user),
            ], // Contains the list of pages
          ),
          bottomNavigationBar: Padding(
              padding: UniversalPlatform.isWeb ? EdgeInsets.only(left: width * .2, right: width * .2) : const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.surface, // Background color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Shadow color
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, -2), // Shadow direction: bottom to top
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: AppColors.background,
                    currentIndex: _currentIndex,
                    // Set the current tab index
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index; // Update the index when a tab is selected
                      });
                    },
                    selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, // Bold text for the selected item
                      color: AppColors.textColor,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.normal, // Normal text for unselected items
                    ),
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        backgroundColor: AppColors.primaryContrast,
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        backgroundColor: AppColors.primaryContrast,
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
