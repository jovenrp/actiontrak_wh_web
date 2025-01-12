
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/widgets/appbar/custom_appbar.dart';
import 'package:actiontrak_wh/application/widgets/cards/no_data.dart';
import 'package:actiontrak_wh/application/widgets/loader/spinner_loader.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/features/container_move/bloc/container_move_bloc.dart';
import 'package:actiontrak_wh/features/container_move/bloc/container_move_state.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';


class ContainerMoveScreen extends StatefulWidget {
  const ContainerMoveScreen({super.key});

  static const String routeName = '/containerMove';
  static const String screenName = 'containerMoveScreen';

  static ModalRoute<ContainerMoveScreen> route() => MaterialPageRoute<ContainerMoveScreen>(
    settings: const RouteSettings(name: routeName),
    builder: (_) => const ContainerMoveScreen(),
  );

  @override
  ContainerMoveScreenState createState() => ContainerMoveScreenState();
}

class ContainerMoveScreenState extends State<ContainerMoveScreen> {
  late double width;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<ContainerMoveBloc>().init();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<ContainerMoveBloc, ContainerMoveState>(
        listener: (BuildContext context, ContainerMoveState state) {
          if (!state.isLoading && state.hasError) {
            context.read<ErrorBloc>().showError(errorMessage: state.errorMessage, errorStatus: state.statusCode);
          }
        },
        builder: (BuildContext context, ContainerMoveState state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Move Container', showBackButton: UniversalPlatform.isWeb ? false : true),
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
                    hintText: 'Move To',
                    icon: Icons.search,
                    controller: searchController,
                    onChanged: (value) {
                      EasyDebounce.debounce('debounce', const Duration(milliseconds: 700), () {
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
          );
        });
  }
}
