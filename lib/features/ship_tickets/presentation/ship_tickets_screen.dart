
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/ship_tickets/bloc/ship_tickets_bloc.dart';
import 'package:actiontrak_wh/features/ship_tickets/bloc/ship_tickets_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';


class ShipTicketsScreen extends StatefulWidget {
  const ShipTicketsScreen({super.key});

  static const String routeName = '/shipTickets';
  static const String screenName = 'shipTicketsScreen';

  static ModalRoute<ShipTicketsScreen> route() => MaterialPageRoute<ShipTicketsScreen>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => const ShipTicketsScreen(),
  );

  @override
  ShipTicketsScreenState createState() => ShipTicketsScreenState();
}

class ShipTicketsScreenState extends State<ShipTicketsScreen> {
  late double width;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<ShipTicketsBloc>().getShipTickets();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<ShipTicketsBloc, ShipTicketsState>(
        listener: (BuildContext context, ShipTicketsState state) {},
        builder: (BuildContext context, ShipTicketsState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Ship Tickets', showBackButton: UniversalPlatform.isWeb ? false : true),
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
                          context.read<ShipTicketsBloc>().searchTicket(value: value);
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
                      : state.shipTickets?.isEmpty == true
                      ? const NoData()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        });
  }
}
