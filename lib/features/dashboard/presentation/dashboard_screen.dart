import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/widgets/buttons/custom_icon_button.dart';
import 'package:actiontrak_wh/features/container_move/presentation/container_move_screen.dart';
import 'package:actiontrak_wh/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/dashboard/bloc/dashboard_state.dart';
import 'package:actiontrak_wh/features/item_lookup/presentation/item_lookup_screen.dart';
import 'package:actiontrak_wh/features/location_mapper/presentation/location_mapper_screen.dart';
import 'package:actiontrak_wh/features/profile/presentation/profile_screen.dart';
import 'package:actiontrak_wh/features/stocks/stock_adjust/presentation/stock_adjust_screen.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/presentation/stock_count_screen.dart';
import 'package:actiontrak_wh/features/stocks/stock_move/presentation/stock_move_screen.dart';
import 'package:actiontrak_wh/features/tickets/pick_tickets/presentation/pick_tickets_screen.dart';
import 'package:actiontrak_wh/features/tickets/receive_tickets/presentation/receive_tickets_screen.dart';
import 'package:actiontrak_wh/features/tickets/ship_tickets/presentation/ship_tickets_screen.dart';
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
        'icon': 'assets/images/png/tickets.png',
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
        'icon': 'assets/images/png/tickets.png',
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
        'icon': 'assets/images/png/ship_container.png',
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
        'icon': 'assets/images/png/location_mapper.png',
        'label': 'Location\nMapper',
        'onTap': UniversalPlatform.isWeb
            ? () {
                setState(() {
                  screenIndex = 3;
                });
              }
            : () {
                Navigator.of(context).push(LocationMapperScreen.route(
                  //parentId: '462',
                  //status: 'parent',
                  parentId: 'root',
                  status: 'children',
                  id: '',
                  containerData: const ContainerData(),
                ));
              },
        'isActive': true,
      },
      {
        'icon': 'assets/images/png/stock_count.png',
        'label': 'Stock\nCount',
        'onTap': UniversalPlatform.isWeb
            ? () {
                setState(() {
                  screenIndex = 4;
                });
              }
            : () {
                Navigator.of(context).push(StockCountScreen.route());
              },
        'isActive': true,
      },
      {
        'icon': 'assets/images/png/item_lookup.png',
        'label': 'Item\nLookup',
        'onTap': UniversalPlatform.isWeb
            ? () {
                setState(() {
                  screenIndex = 5;
                });
              }
            : () {
                Navigator.of(context).push(ItemLookupScreen.route());
              },
        'isActive': true,
      },
      {
        'icon': 'assets/images/png/stock_adjust.png',
        'label': 'Stock\nAdjust',
        'onTap': UniversalPlatform.isWeb
            ? () {
                setState(() {
                  screenIndex = 6;
                });
              }
            : () {
                Navigator.of(context).push(StockAdjustScreen.route());
              },
        'isActive': true,
      },
      {
        'icon': 'assets/images/png/stock_move.png',
        'label': 'Stock\nMove',
        'onTap': UniversalPlatform.isWeb
            ? () {
          setState(() {
            screenIndex = 7;
          });
        }
            : () {
          Navigator.of(context).push(StockMoveScreen.route());
        },
        'isActive': true,
      },
      {
        'icon': 'assets/images/png/container_move.png',
        'label': 'Container\nMove',
        'onTap': UniversalPlatform.isWeb
            ? () {
          setState(() {
            screenIndex = 8;
          });
        }
            : () {
          Navigator.of(context).push(ContainerMoveScreen.route());
        },
        'isActive': true,
      },
      {
        'icon': 'assets/images/png/stock_consume.png',
        'label': 'Stock\nConsume',
        'onTap': () {},
        'isActive': false,
      },
      {
        'icon': 'assets/images/png/stock_receive.png',
        'label': 'Stock\nReceive',
        'onTap': () {},
        'isActive': false,
      },
      {
        'icon': 'assets/images/png/stock_ship.png',
        'label': 'Stock\nShip',
        'onTap': () {},
        'isActive': false,
      },
    ];

    screens = [
      const PickTicketsScreen(),
      const ReceiveTicketsScreen(),
      const ShipTicketsScreen(),
      const LocationMapperScreen(),
      const StockCountScreen(),
      const ItemLookupScreen(),
      const StockAdjustScreen(),
      const StockMoveScreen(),
      const ContainerMoveScreen(),
      const ProfileScreen(),
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
                              childAspectRatio: .9, // Aspect ratio of the grid items
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return CustomIconButton(
                                icon: items[index]['icon'],
                                turn: items[index]['label'] == 'Pick\nTickets' ? 2 : 0,
                                label: items[index]['label'],
                                onTap: items[index]['onTap'],
                                textSize: 15,
                                iconSize: 45,
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
