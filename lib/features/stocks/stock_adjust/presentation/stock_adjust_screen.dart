
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/stocks/stock_adjust/bloc/stock_adjust_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';


class StockAdjustScreen extends StatefulWidget {
  const StockAdjustScreen({super.key});

  static const String routeName = '/stockAdjust';
  static const String screenName = 'stockAdjustScreen';

  static ModalRoute<StockAdjustScreen> route() => MaterialPageRoute<StockAdjustScreen>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => const StockAdjustScreen(),
  );

  @override
  StockAdjustScreenState createState() => StockAdjustScreenState();
}

class StockAdjustScreenState extends State<StockAdjustScreen> {
  late double width;

  final TextEditingController codeController = TextEditingController();
  final TextEditingController skuController = TextEditingController();

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
                    hintText: 'Search Location/Code',
                    icon: Icons.search,
                    controller: codeController,
                    onChanged: (value) {
                      EasyDebounce.debounce('debounce1', const Duration(milliseconds: 700), () {
                        setState(() {
                          if (skuController.text.isNotEmpty == true && value?.isNotEmpty == true) {
                            context.read<StockAdjustBloc>().stockLookUp(sku: skuController.text,
                                locNum: codeController.text);
                          }
                        });
                      });
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    hintText: 'Search SKU',
                    icon: Icons.search,
                    controller: skuController,
                    onChanged: (value) {
                      EasyDebounce.debounce('debounce2', const Duration(milliseconds: 700), () {
                        setState(() {
                          if (skuController.text.isNotEmpty == true && value?.isNotEmpty == true) {
                            context.read<StockAdjustBloc>().stockLookUp(sku: skuController.text,
                                locNum: codeController.text);
                          }
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
