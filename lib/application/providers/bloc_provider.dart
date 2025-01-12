
import 'package:actiontrak_wh/features/container_move/bloc/container_move_bloc.dart';
import 'package:actiontrak_wh/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/item_lookup/bloc/item_lookup_bloc.dart';
import 'package:actiontrak_wh/features/location_mapper/bloc/location_mapper_bloc.dart';
import 'package:actiontrak_wh/features/login/bloc/login_bloc.dart';
import 'package:actiontrak_wh/features/navigation/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/profile/bloc/profile_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_adjust/bloc/stock_adjust_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_bloc.dart';
import 'package:actiontrak_wh/features/stocks/stock_move/bloc/stock_move_bloc.dart';
import 'package:actiontrak_wh/features/tickets/pick_tickets/bloc/pick_tickets_bloc.dart';
import 'package:actiontrak_wh/features/tickets/receive_tickets/bloc/receive_tickets_bloc.dart';
import 'package:actiontrak_wh/features/tickets/ship_tickets/bloc/ship_tickets_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/splash/bloc/splash_bloc.dart';
import '../services/persistence_service.dart';
import 'error_bloc.dart';

class BlocsProvider {
  static List<SingleChildWidget> provide() =>
      <SingleChildWidget>[
        BlocProvider<ErrorBloc>(
          create: (_) => ErrorBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (_) => SplashBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider<PickTicketsBloc>(
          create: (_) => PickTicketsBloc(),
        ),
        BlocProvider<ReceiveTicketsBloc>(
          create: (_) => ReceiveTicketsBloc(),
        ),
        BlocProvider<LocationMapperBloc>(
          create: (_) => LocationMapperBloc(),
        ),
        BlocProvider<ShipTicketsBloc>(
          create: (_) => ShipTicketsBloc(),
        ),
        BlocProvider<StockCountBloc>(
          create: (_) => StockCountBloc(),
        ),
        BlocProvider<ItemLookupBloc>(
          create: (_) => ItemLookupBloc(),
        ),
        BlocProvider<StockAdjustBloc>(
          create: (_) => StockAdjustBloc(),
        ),
        BlocProvider<StockMoveBloc>(
          create: (_) => StockMoveBloc(),
        ),
        BlocProvider<ContainerMoveBloc>(
          create: (_) => ContainerMoveBloc(),
        ),
      ];
}
