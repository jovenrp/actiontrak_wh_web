import 'dart:async';

import 'package:actiontrak_wh/application/models/receive_tickets/receive_tickets_data.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_receive_detail_row.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/receive_tickets/bloc/receive_tickets_bloc.dart';
import 'package:actiontrak_wh/features/receive_tickets/bloc/receive_tickets_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceiveTicketDetails extends StatefulWidget {
  const ReceiveTicketDetails({super.key, this.receiveTicket});

  final ReceiveTicketsData? receiveTicket;

  static const String routeName = '/receiveTicketDetails';
  static const String screenName = 'receiveTicketDetailsScreen';

  static ModalRoute<ReceiveTicketDetails> route({ReceiveTicketsData? receiveTicket}) => MaterialPageRoute<ReceiveTicketDetails>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => ReceiveTicketDetails(receiveTicket: receiveTicket,),
  );

  @override
  ReceiveTicketDetailsState createState() => ReceiveTicketDetailsState();
}

class ReceiveTicketDetailsState extends State<ReceiveTicketDetails> {
  late double width;
  int turns = 0;

  late Timer rotatingTimer;

  final Map<int, int> _checkboxStates = {};

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<ReceiveTicketsBloc>().getReceiveTicketsDetails(id: widget.receiveTicket?.id);

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
            appBar: const CustomAppBar(title: 'Receiving', showBackButton: true),
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
                    : state.receiveTicketDetails?.isEmpty == true
                    ? const NoData()
                    : Expanded(
                  child: RefreshIndicator(
                      child: ListView.separated(
                        itemCount: state.receiveTicketDetails?.isNotEmpty == true ? state.receiveTicketDetails!.length + 1 : 0,
                        itemBuilder: (BuildContext context, int i) {
                          if (i == 0) {
                            /*return const CustomTableHeader(
                              header1: 'SKU',
                              header2: 'LOCATION',
                              header3: 'RCVD',
                            );*/
                            return const SizedBox.shrink();
                          }
                          i--;
                          String qtyOrder = state.receiveTicketDetails?[i].qtyOrder ?? '0';
                          String qtyRcvd = state.receiveTicketDetails?[i].qtyReceived ?? '0';
                          String qtyUnit = state.receiveTicketDetails?[i].qtyUnit ?? '0';
                          String uom = state.receiveTicketDetails?[i].uom ?? 'EA';
                          String itemId = state.receiveTicketDetails?[i].itemId ?? '--';
                          String isUnder = state.receiveTicketDetails?[i].isUnder ?? 'n';
                          String isOver = state.receiveTicketDetails?[i].isOver ?? 'n';
                          String isComplete = state.receiveTicketDetails?[i].isComplete ?? 'n';

                          _checkboxStates[i] = checkboxState(isOver: isOver, isUnder: isUnder, isComplete: isComplete, qtyOrder: qtyOrder, qtyRcvd: qtyRcvd);

                          //qtyOrd of qtyRcvd
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                            child: CustomCheckboxRow(
                              id: i,
                              itemId: itemId,
                              qtyReceived: _getQuantityReceived(qtyOrder: qtyOrder, qtyRcvd: qtyRcvd),
                              uom: '$uom $qtyUnit',
                              checkboxState: _checkboxStates[i] ?? 0,
                              onCheckboxToggle: (id) {
                                setState(() {
                                  _checkboxStates[id] = (_checkboxStates[id] ?? 0 + 1) % 3;
                                });
                              },
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

  int checkboxState({String? isOver, String? isUnder, String? isComplete, String? qtyOrder, String? qtyRcvd}) {
    /// 0 is default
    /// 1 is over or under
    /// 2 is success

    if (isComplete?.toLowerCase() == 'y') {
      return 2;
    } else if (isComplete?.toLowerCase() == 'n' && isOver?.toLowerCase() == 'y' || isUnder?.toLowerCase() == 'y') {
      return 1;
    } else {
      return 0;
    }

  }

  String _getQuantityReceived({String? qtyOrder, String? qtyRcvd}) {
    return '${parseString(qtyRcvd ?? '0')} of ${parseString(qtyOrder ?? '0')}';
  }

  int parseString(String value) {
    if (value.isEmpty) {
      return 0; // Return 0 if the string is empty
    } else if (value.contains('.')) {
      double parsedDouble = double.parse(value);
      return parsedDouble.round(); // Round the double and return as int
    } else {
      return int.parse(value); // Parse and return as int
    }
  }
}
