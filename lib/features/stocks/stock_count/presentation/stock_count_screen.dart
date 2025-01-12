
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';


class StockCountScreen extends StatefulWidget {
  const StockCountScreen({super.key});

  static const String routeName = '/stockCount';
  static const String screenName = 'stockCountScreen';

  static ModalRoute<StockCountScreen> route() => MaterialPageRoute<StockCountScreen>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => const StockCountScreen(),
  );

  @override
  StockCountScreenState createState() => StockCountScreenState();
}

class StockCountScreenState extends State<StockCountScreen> {
  late double width;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<StockCountBloc>().getStockCount();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<StockCountBloc, StockCountState>(
        listener: (BuildContext context, StockCountState state) {
          if (!state.isLoading && state.hasError) {
            context.read<ErrorBloc>().showError(errorMessage: state.errorMessage, errorStatus: state.statusCode);
          }
        },
        builder: (BuildContext context, StockCountState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Stock Count Tickets', showBackButton: UniversalPlatform.isWeb ? false : true),
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
                      EasyDebounce.debounce('debounce', const Duration(milliseconds: 700), () {
                        setState(() {
                          context.read<StockCountBloc>().searchTicket(value: value);
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
                      : state.stockCount?.isEmpty == true
                      ? const NoData()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        });
  }
}
