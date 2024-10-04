import 'dart:async';

import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_receive_row.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_table_header.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/pick_tickets/bloc/pick_tickets_bloc.dart';
import 'package:actiontrak_wh/features/pick_tickets/bloc/pick_tickets_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

// ignore: unused_import
import '../../../application/widgets/cards/pick_ticket_card.dart';

class PickTicketsScreen extends StatefulWidget {
  const PickTicketsScreen({super.key});

  static const String routeName = '/pickTickets';
  static const String screenName = 'pickTicketsScreen';

  static ModalRoute<PickTicketsScreen> route() => MaterialPageRoute<PickTicketsScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const PickTicketsScreen(),
      );

  @override
  PickTicketsScreenState createState() => PickTicketsScreenState();
}

class PickTicketsScreenState extends State<PickTicketsScreen> {
  late double width;
  int turns = 0;

  late Timer rotatingTimer;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<PickTicketsBloc>().getPickTickets();

    rotatingTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        turns++;
        if (turns == 4) {
          turns = 0;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    rotatingTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<PickTicketsBloc, PickTicketsState>(
        listener: (BuildContext context, PickTicketsState state) {},
        builder: (BuildContext context, PickTicketsState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Pick Tickets', showBackButton: UniversalPlatform.isWeb ? false : true),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomTextField(
                    hintText: 'Search',
                    icon: Icons.search,
                    controller: searchController,
                    onChanged: (value) {
                      EasyDebounce.debounce('deebouncer1', const Duration(milliseconds: 700), () {
                        setState(() {
                          context.read<PickTicketsBloc>().searchPickTicket(value: value);
                        });
                      });
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state.isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: SpinnerLoader(),
                        )
                      : state.pickTickets?.isEmpty == true
                          ? const NoData()
                          : Expanded(
                              child: RefreshIndicator(
                                  child: ListView.separated(
                                    itemCount: state.pickTickets?.isNotEmpty == true ? state.pickTickets!.length + 1 : 0,
                                    itemBuilder: (BuildContext context, int i) {
                                      if (i == 0) {
                                        return const CustomTableHeader(
                                          header1: 'ORDER #',
                                          header2: 'LOCATION',
                                          header3: 'LINES',
                                        );
                                      }
                                      i--;
                                      return GestureDetector(
                                        onTap: () {},
                                        child: CustomReceiveRow(
                                          orderNumber: state.pickTickets?[i].num,
                                          location: state.pickTickets?[i].destination,
                                          lines: state.pickTickets?[i].numLines,
                                          status: state.pickTickets?[i].status,
                                          turns: turns,
                                          size: 20,
                                          isOdd: i % 2 == 0,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int i) {
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                  onRefresh: () async => context.read<PickTicketsBloc>().getPickTickets()),
                            ),
                ],
              ),
            ),
          );
        });
  }
}
