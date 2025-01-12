import 'dart:async';

import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_detail_data.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_tickets_data.dart';
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/buttons/custom_button.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/dialogs/custom_dialog.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/tables/custom_receive_detail_row.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/tickets/receive_tickets/bloc/receive_tickets_bloc.dart';
import 'package:actiontrak_wh/features/tickets/receive_tickets/bloc/receive_tickets_state.dart';
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
        builder: (_) => ReceiveTicketDetails(
          receiveTicket: receiveTicket,
        ),
      );

  @override
  ReceiveTicketDetailsState createState() => ReceiveTicketDetailsState();
}

class ReceiveTicketDetailsState extends State<ReceiveTicketDetails> {
  late double width;
  int turns = 0;
  bool isOverPickAllowed = false;

  final Map<int, int> _checkboxStates = {};
  final TextEditingController searchController = TextEditingController();
  List<ReceiveTicketDetailsData> tempTickets = [];

  @override
  void initState() {
    getSettings();
    context.read<ReceiveTicketsBloc>().getReceiveTicketsDetails(id: widget.receiveTicket?.id);
    super.initState();
  }

  Future<void> getSettings() async {
    bool? isOverPick = await getBool('pickLimitSetting');
    if (isOverPick != null) {
      isOverPickAllowed = isOverPick;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<ReceiveTicketsBloc, ReceiveTicketsState>(listener: (BuildContext context, ReceiveTicketsState state) {
      if (!state.isLoading && state.receiveTicketDetails?.isNotEmpty == true) {
        tempTickets = state.receiveTicketDetails ?? [];
      }

      if (state.hasError) {
        context.read<ErrorBloc>().showError(errorMessage: state.errorMessage, errorStatus: state.statusCode);
      }
    }, builder: (BuildContext context, ReceiveTicketsState state) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Receiving ${widget.receiveTicket?.vendorName}', showBackButton: true),
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
                  EasyDebounce.debounce('debounce', const Duration(milliseconds: 700), () {
                    setState(() {
                      context.read<ReceiveTicketsBloc>().searchReceiveTicketDetails(value: value, id: widget.receiveTicket?.id);
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
                : tempTickets.isEmpty == true
                    ? const NoData()
                    : Expanded(
                        child: RefreshIndicator(
                            child: ListView.separated(
                              itemCount: tempTickets.isNotEmpty == true ? tempTickets.length + 1 : 0,
                              itemBuilder: (BuildContext context, int i) {
                                if (i == 0) {
                                  return const SizedBox.shrink();
                                }
                                i--;
                                String sku = tempTickets[i].itemId ?? '';
                                String qtyOrder = tempTickets[i].qtyOrder ?? '0';
                                String qtyRcvd = tempTickets[i].qtyReceived ?? '0';
                                String qtyUnit = tempTickets[i].qtyUnit ?? '0';
                                String uom = tempTickets[i].uom ?? 'EA';
                                String itemId = tempTickets[i].itemId ?? '--';
                                String isUnder = tempTickets[i].isUnder ?? 'n';
                                String isOver = tempTickets[i].isOver ?? 'n';
                                String isComplete = tempTickets[i].isComplete ?? 'n';

                                _checkboxStates[i] = checkboxState(isOver: isOver, isUnder: isUnder, isComplete: isComplete, qtyOrder: qtyOrder, qtyRcvd: qtyRcvd);
                                final TextEditingController textController = TextEditingController();
                                final FocusNode focusNode = FocusNode();
                                //focusNode.requestFocus();
                                //qtyRcvd of qtyOrder
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                  child: CustomCheckboxRow(
                                    id: i,
                                    controller: textController,
                                    focusNode: focusNode,
                                    itemId: itemId,
                                    qtyReceived: _getQuantityReceived(qtyOrder: qtyOrder, qtyRcvd: qtyRcvd, sku: itemId),
                                    uom: '$uom $qtyUnit',
                                    checkboxState: _checkboxStates[i] ?? 0,
                                    onPressed: () {
                                      setState(() {
                                        if (parseString(textController.text) > parseString(qtyOrder)) {
                                          if (!isOverPickAllowed) {
                                            showOverPickDialog(context);
                                          } else {
                                            //warning dialog
                                            showOverPickWarningDialog(context, () {
                                              tempTickets[i].qtyReceived = textController.text;
                                              tempTickets[i].isComplete = 'N';
                                              tempTickets[i].isOver = 'Y';
                                              _checkboxStates[i] = 1;
                                              context.read<ReceiveTicketsBloc>().submitReceiveDetail(
                                                id: tempTickets[i].id,
                                                containerId: tempTickets[i].containerId,
                                                qtyReceived: tempTickets[i].qtyReceived,
                                              );
                                              Navigator.of(context).pop();
                                            });
                                          }
                                        } else {
                                          if (parseString(textController.text) == parseString(qtyOrder)) {
                                            tempTickets[i].qtyReceived = textController.text;
                                            tempTickets[i].isComplete = 'Y';
                                            tempTickets[i].isOver = 'N';
                                            _checkboxStates[i] = 2;
                                          } else if (parseString(textController.text) == 0) {
                                            tempTickets[i].qtyReceived = textController.text;
                                            tempTickets[i].isComplete = 'N';
                                            tempTickets[i].isOver = 'N';
                                            _checkboxStates[i] = 0;
                                          } else {
                                            tempTickets[i].qtyReceived = textController.text;
                                            tempTickets[i].isComplete = 'N';
                                            tempTickets[i].isOver = 'N';
                                            _checkboxStates[i] = 1;
                                          }

                                          context.read<ReceiveTicketsBloc>().submitReceiveDetail(
                                            id: tempTickets[i].id,
                                            containerId: tempTickets[i].containerId,
                                            qtyReceived: tempTickets[i].qtyReceived,
                                          );
                                        }
                                      });
                                    },
                                    onCheckboxToggle: (id) {
                                      setState(() {
                                        if (parseString(qtyRcvd) == parseString(qtyOrder)) {
                                          tempTickets[i].qtyReceived = '0';
                                          tempTickets[i].isComplete = 'N';
                                          _checkboxStates[id] = 0;
                                        } else if (parseString(qtyRcvd) == 0) {
                                          tempTickets[i].qtyReceived = qtyOrder;
                                          tempTickets[i].isComplete = 'Y';
                                          _checkboxStates[id] = 2;
                                        } else if (parseString(qtyRcvd) > parseString(qtyOrder) || (parseString(qtyRcvd) < parseString(qtyOrder) && parseString(qtyRcvd) != 0)) {
                                          tempTickets[i].qtyReceived = qtyOrder;
                                          tempTickets[i].isComplete = 'Y';
                                          tempTickets[i].isOver = 'N';
                                          _checkboxStates[id] = 2;
                                        } else {
                                          tempTickets[i].isComplete = 'N';
                                          _checkboxStates[id] = 1;
                                        }
                                        context.read<ReceiveTicketsBloc>().submitReceiveDetail(
                                              id: tempTickets[i].id,
                                              containerId: tempTickets[i].containerId,
                                              qtyReceived: tempTickets[i].qtyReceived,
                                            );
                                        //_checkboxStates[id] = (_checkboxStates[id] ?? 0 + 1) % 3;
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: CustomButton(
            text: 'Complete',
            onPressed: () {
              bool isPartial = false;
              for (var ticket in tempTickets) {
                if (ticket.qtyReceived == '0') {
                  isPartial = true;
                  break;
                } else if (parseString(ticket.qtyReceived ?? '0').toInt() < parseString(ticket.qtyOrder ?? '0').toInt() ||
                    parseString(ticket.qtyReceived ?? '0').toInt() > parseString(ticket.qtyOrder ?? '0').toInt()) {
                  isPartial = true;
                  break;
                }
              }

              if (isPartial) {
                showCompleteWarningDialog(context, () {
                  Navigator.of(context).pop();
                  context.read<ReceiveTicketsBloc>().completeReceiveTicket(id: widget.receiveTicket?.id).then((value) {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  });
                });
              } else {
                showCompleteDialog(context, () {
                  Navigator.of(context).pop();
                  context.read<ReceiveTicketsBloc>().completeReceiveTicket(id: widget.receiveTicket?.id).then((value) {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  });
                }, num: widget.receiveTicket?.vendorName);
              }
            },
          ),
        ),
      );
    });
  }

  int checkboxState({String? isOver, String? isUnder, String? isComplete, String? qtyOrder, String? qtyRcvd}) {
    /// 0 is default
    /// 1 is over or under
    /// 2 is success

    final rcvd = parseString(qtyRcvd ?? '0');
    final order = parseString(qtyOrder ?? '0');
    if (isComplete?.toLowerCase() == 'y') {
      return 2;
    } else if (rcvd != 0 && rcvd < order) {
      return 1;
    } else if (rcvd > order) {
      return 1;
    } else if (isComplete?.toLowerCase() == 'n') {
      return 0;
    } else {
      return 0;
    }
  }

  String _getQuantityReceived({String? qtyOrder, String? qtyRcvd, String? sku}) {
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

  void showOverPickDialog(context) {
    showCustomDialog(
      context,
      type: IconType.error,
      title: 'Not Allowed',
      content: 'Over picking is not allowed! ',
      confirmButtonText: 'Close',
      noButton: false,
      onConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }

  void showOverPickWarningDialog(context, onTap) {
    showCustomDialog(
      context,
      type: IconType.warning,
      title: 'Warning',
      content: 'You are about to over pick an item, do you want to continue?',
      confirmButtonText: 'Continue',
      onConfirm: onTap,
      cancelButtonText: 'Cancel',
    );
  }

  void showCompleteWarningDialog(context, onTap) {
    showCustomDialog(
      context,
      type: IconType.warning,
      title: 'Partial Complete?',
      content: 'There are items that are partially picked.',
      confirmButtonText: 'Complete Anyway',
      noButton: false,
      onConfirm: onTap,
      cancelButtonText: 'Cancel',
    );
  }

  void showCompleteDialog(context, onTap, {String? num}) {
    showCustomDialog(
      context,
      type: IconType.warning,
      title: 'Complete?',
      content: 'This will complete the tickets for $num',
      confirmButtonText: 'Complete',
      noButton: false,
      onConfirm: onTap,
      cancelButtonText: 'Cancel',
    );
  }
}
