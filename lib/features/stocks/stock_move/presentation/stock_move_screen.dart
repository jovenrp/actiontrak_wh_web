
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/buttons/custom_button.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_state.dart';
import 'package:actiontrak_wh/features/stocks/stock_move/bloc/stock_move_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_move/bloc/stock_move_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';


class StockMoveScreen extends StatefulWidget {
  const StockMoveScreen({super.key});

  static const String routeName = '/stockMove';
  static const String screenName = 'stockMoveScreen';

  static ModalRoute<StockMoveScreen> route() => MaterialPageRoute<StockMoveScreen>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => const StockMoveScreen(),
  );

  @override
  StockMoveScreenState createState() => StockMoveScreenState();
}

class StockMoveScreenState extends State<StockMoveScreen> {
  late double width;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    //context.read<StockCountBloc>().getStockCount();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<StockMoveBloc, StockMoveState>(
        listener: (BuildContext context, StockMoveState state) {
          if (!state.isLoading && state.hasError) {
            context.read<ErrorBloc>().showError(errorMessage: state.errorMessage, errorStatus: state.statusCode);
          }
        },
        builder: (BuildContext context, StockMoveState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Stock Move', showBackButton: UniversalPlatform.isWeb ? false : true),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Move From',
                            icon: Icons.house_outlined,
                            controller: searchController,
                            onChanged: (value) {
                              EasyDebounce.debounce('debounce1', const Duration(milliseconds: 700), () {
                                setState(() {
                                  //context.read<StockCountBloc>().searchTicket(value: value);
                                });
                              });
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Move To',
                            icon: Icons.house_outlined,
                            controller: searchController,
                            onChanged: (value) {
                              EasyDebounce.debounce('debounce4', const Duration(milliseconds: 700), () {
                                setState(() {
                                  //context.read<StockCountBloc>().searchTicket(value: value);
                                });
                              });
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    hintText: 'SKU',
                    icon: Icons.search,
                    controller: searchController,
                    onChanged: (value) {
                      EasyDebounce.debounce('debounce2', const Duration(milliseconds: 700), () {
                        setState(() {
                          //context.read<StockCountBloc>().searchTicket(value: value);
                        });
                      });
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Quantity',
                    icon: Icons.numbers_outlined,
                    controller: searchController,
                    onChanged: (value) {
                      EasyDebounce.debounce('debounce3', const Duration(milliseconds: 700), () {
                        setState(() {
                          //context.read<StockCountBloc>().searchTicket(value: value);
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
                      : state.containers?.isEmpty == true
                      ? const NoData()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(text: 'Submit', onPressed: () {}),
            ),
          );
        });
  }
}
