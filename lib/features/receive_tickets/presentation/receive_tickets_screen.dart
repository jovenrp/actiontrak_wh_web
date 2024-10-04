import 'dart:async';

import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_receive_row.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_table_header.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/receive_tickets/bloc/receive_tickets_bloc.dart';
import 'package:actiontrak_wh/features/receive_tickets/bloc/receive_tickets_state.dart';
import 'package:actiontrak_wh/features/receive_tickets/presentation/receive_ticket_details.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

class ReceiveTicketsScreen extends StatefulWidget {
  const ReceiveTicketsScreen({super.key});

  static const String routeName = '/receiveTickets';
  static const String screenName = 'receiveTicketsScreen';

  static ModalRoute<ReceiveTicketsScreen> route() => MaterialPageRoute<ReceiveTicketsScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ReceiveTicketsScreen(),
      );

  @override
  ReceiveTicketsScreenState createState() => ReceiveTicketsScreenState();
}

class ReceiveTicketsScreenState extends State<ReceiveTicketsScreen> {
  late double width;
  int turns = 0;

  late Timer rotatingTimer;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<ReceiveTicketsBloc>().getReceiveTickets();

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

    return BlocConsumer<ReceiveTicketsBloc, ReceiveTicketsState>(
        listener: (BuildContext context, ReceiveTicketsState state) {},
        builder: (BuildContext context, ReceiveTicketsState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Purchase Orders', showBackButton: UniversalPlatform.isWeb ? false : true),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomTextField(
                    hintText: 'Search',
                    icon: Icons.search,
                    controller: searchController,
                    onChanged: (value) {
                      EasyDebounce.debounce('deebouncer1', const Duration(milliseconds: 700), () {
                        setState(() {
                          context.read<ReceiveTicketsBloc>().searchReceiveTicket(value: value);
                        });
                      });
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                state.isLoading
                    ? const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: SpinnerLoader(),
                )
                    : state.receiveTickets?.isEmpty == true
                    ? const NoData()
                    : Expanded(
                  child: RefreshIndicator(
                      child: ListView.separated(
                        itemCount: state.receiveTickets?.isNotEmpty == true ? state.receiveTickets!.length + 1 : 0,
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
                            onTap: () {
                              Navigator.of(context).push(
                                ReceiveTicketDetails.route(receiveTicket: state.receiveTickets?[i]),
                              );
                            },
                            child: CustomReceiveRow(
                              orderNumber: state.receiveTickets?[i].num,
                              location: state.receiveTickets?[i].vendorName,
                              lines: state.receiveTickets?[i].numLines,
                              status: state.receiveTickets?[i].status,
                              turns: turns,
                              size: 20,
                              isOdd: i % 2 == 0 ,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int i) {
                          return const SizedBox.shrink();
                        },
                      ),
                      onRefresh: () async => context.read<ReceiveTicketsBloc>().getReceiveTickets()),
                ),
              ],
            ),
          );
        });
  }
}
