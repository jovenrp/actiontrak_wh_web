import 'package:actiontrak_wh/application/widgets/buttons/custom_icon_button.dart';
import 'package:actiontrak_wh/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/dashboard/bloc/dashboard_state.dart';
import 'package:actiontrak_wh/features/pick_tickets/presentation/pick_tickets_screen.dart';
import 'package:actiontrak_wh/features/receive_tickets/presentation/receive_tickets_screen.dart';
import 'package:actiontrak_wh/features/ship_tickets/presentation/ship_tickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../application/utils/app_colors.dart';
import '../../../application/widgets/texts/custom_greetings.dart';
import 'dashboard_web_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.user});

  final String? user;

  static const String routeName = '/home';
  static const String screenName = 'homeScreen';

  static ModalRoute<DashboardScreen> route({String? user}) => MaterialPageRoute<DashboardScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => DashboardScreen(
          user: user,
        ),
      );

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  late double height;
  late double width;

  List<Map<String, dynamic>> items = [];
  List<Widget> screens = [];
  int screenIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      {
        'icon': Icons.note_alt_outlined,
        'label': 'Pick\nTickets',
        'onTap': UniversalPlatform.isWeb
            ? () {
                setState(() {
                  screenIndex = 0;
                });
              }
            : () {
                Navigator.of(context).push(PickTicketsScreen.route());
              },
        'isActive': true,
      },
      {
        'icon': Icons.sticky_note_2_outlined,
        'label': 'Purchase\nOrders',
        'onTap': UniversalPlatform.isWeb
            ? () {
                setState(() {
                  screenIndex = 1;
                });
              }
            : () {
                Navigator.of(context).push(ReceiveTicketsScreen.route());
              },
        'isActive': true,
      },
      {
        'icon': Icons.local_shipping_outlined,
        'label': 'Ship\n',
        'onTap': UniversalPlatform.isWeb
            ? () {
          setState(() {
            screenIndex = 2;
          });
        }
            : () {
          Navigator.of(context).push(ShipTicketsScreen.route());
        },
        'isActive': true,
      },
      {
        'icon': Icons.location_on_outlined,
        'label': 'Location\nMapper',
        'onTap': () {},
        'isActive': true,
      },
      {
        'icon': Icons.numbers,
        'label': 'Stock\nCount',
        'onTap': () {},
        'isActive': true,
      },
      {
        'icon': Icons.search,
        'label': 'Item\nLookup',
        'onTap': () {},
        'isActive': true,
      },
      {
        'icon': Icons.adjust,
        'label': 'Stock\nAdjust',
        'onTap': () {},
        'isActive': true,
      },
      {
        'icon': Icons.fire_truck_outlined,
        'label': 'Stock\nMove',
        'onTap': () {},
        'isActive': true,
      },
      {
        'icon': Icons.move_up_outlined,
        'label': 'Container\nMove',
        'onTap': () {},
        'isActive': true,
      },
      {
        'icon': Icons.leak_remove,
        'label': 'Stock\nConsume',
        'onTap': () {},
        'isActive': false,
      },
      {
        'icon': Icons.move_down_outlined,
        'label': 'Stock\nReceive',
        'onTap': () {},
        'isActive': false,
      },
      {
        'icon': Icons.move_to_inbox_outlined,
        'label': 'Stock\nShip',
        'onTap': () {},
        'isActive': false,
      },
    ];

    screens = [
      const PickTicketsScreen(),
      const ReceiveTicketsScreen(),
      const ShipTicketsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (BuildContext context, DashboardState state) {},
      builder: (BuildContext context, DashboardState state) {
        return UniversalPlatform.isWeb
            ? DashboardWebView(
                items: items,
                user: widget.user,
                width: width,
                height: height,
                screens: screens,
                screenIndex: screenIndex,
              )
            : Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomGreetings(
                          nickname: '${widget.user}!',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration:
                              const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)), color: AppColors.background),
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Two items per row
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 1.0, // Aspect ratio of the grid items
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return CustomIconButton(
                                icon: items[index]['icon'],
                                label: items[index]['label'],
                                onTap: items[index]['onTap'],
                                textSize: 14,
                                iconSize: 30,
                                isActive: items[index]['isActive'],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
