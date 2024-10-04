
import 'package:actiontrak_wh/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/login/bloc/login_bloc.dart';
import 'package:actiontrak_wh/features/navigation/bloc/dashboard_bloc.dart';
import 'package:actiontrak_wh/features/pick_tickets/bloc/pick_tickets_bloc.dart';
import 'package:actiontrak_wh/features/profile/bloc/profile_bloc.dart';
import 'package:actiontrak_wh/features/receive_tickets/bloc/receive_tickets_bloc.dart';
import 'package:actiontrak_wh/features/ship_tickets/bloc/ship_tickets_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/splash/bloc/splash_bloc.dart';
import '../services/persistence_service.dart';

class BlocsProvider {
  static List<SingleChildWidget> provide({
    required PersistenceService persistenceService,
  }) =>
      <SingleChildWidget>[
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
        BlocProvider<ShipTicketsBloc>(
          create: (_) => ShipTicketsBloc(),
        ),
      ];
}
