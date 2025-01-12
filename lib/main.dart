
import 'dart:async';

import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/providers/error_state.dart';
import 'package:actiontrak_wh/application/utils/app_colors_dark.dart';
import 'package:actiontrak_wh/application/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;

import 'application/providers/bloc_provider.dart';
import 'application/repositories/local_repository/memory_repository.dart';
import 'application/repositories/local_repository/secured_local_repository.dart';
import 'application/repositories/local_repository/unsecured_local_repository.dart';
import 'application/services/persistence_service.dart';
import 'application/utils/app_colors.dart';
import 'features/splash/bloc/splash_bloc.dart';
import 'features/splash/bloc/splash_state.dart';
import 'features/splash/presentation/splash_screen.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*await Hive.initFlutter();
  Hive.registerAdapter(UserHiveAdapter());
  Hive.registerAdapter(ProductHiveAdapter());
  Hive.registerAdapter(SalesHiveAdapter());

  await Hive.openBox<UserHive>('user_box');
  await Hive.openBox<ProductHive>('product_box');
  await Hive.openBox<SalesHive>('sales_box');*/

  FlutterError.onError = (FlutterErrorDetails details) {
    // Log or handle the error details
    //print(details);
  };

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  PersistenceService persistenceService = PersistenceService(
    SecuredLocalRepository(const fss.FlutterSecureStorage()),
    UnsecuredLocalRepository(sharedPreferences),
    MemoryRepository(),
  );

  runApp(MyApp(persistenceService: persistenceService));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.persistenceService});

  final PersistenceService persistenceService;


  @override
  MyAppState createState() => MyAppState();

}

class MyAppState extends State<MyApp> {
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    final List<SingleChildWidget> blocs = BlocsProvider.provide();

    List<SingleChildWidget> providers = <SingleChildWidget>[
      ...blocs,
    ];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiProvider(
        providers: providers,
        child: BlocConsumer<ErrorBloc, ErrorState>(
          listener: (BuildContext context, ErrorState state) {

            if (!state.isLoading && state.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showCustomDialog(
                  navigatorKey.currentState!.context,
                  type: IconType.error,
                  title: 'Failed',
                  content: state.errorMessage,
                  confirmButtonText: 'Close',
                  onConfirm: () {
                    Navigator.of(navigatorKey.currentState!.context).pop();
                  },
                );
              });
            }
          },
          builder: (BuildContext context, __) => MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: lightMode(),
            themeMode: ThemeMode.system,
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }


  ThemeData lightMode() {
    return ThemeData(
      // Defining the ColorScheme using theme variables from the loaded theme
      colorScheme: ColorScheme(
        primary: Color(0xFF2196F3),
        secondary: Color(0xFF03DAC6), // Bright Green for success actions
        surface: Color(0xFFF5F5F5), // White for surface areas (e.g., cards)
        onPrimary: Color(0xFFFFFFFF), // White text on primary elements
        onSecondary: Color(0xFF000000), // White text on secondary elements
        error: Color(0xFFB00020), // Soft Red for errors
        onError: Color(0xFFFFFFFF), // White text on error elements
        onSurface: Color(0xFF000000), // Dark Gray for text on surfaces
        brightness: Brightness.light, // Define light theme
      ),

      scaffoldBackgroundColor: Color(0xFFF5F5F5), // Set background color

      // App bar theme using theme data from loaded theme
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF2196F3),
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons in AppBar
      ),

      // Button theme using theme data
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2196F3), // Soft Blue for buttons
          foregroundColor: Color(0xFFFFFFFF),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Floating Action Button theme using theme data
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF03DAC6), // Soft Blue FAB
        foregroundColor: Color(0xFFFFFFFF), // White icon
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFFFFFF), // White for bottom navigation bar
        selectedItemColor: Color(0xFF2196F3), // Soft Blue for selected items
        unselectedItemColor: Color(0xFF03DAC6), // Light Gray for unselected items
      ),

      // Input decoration theme for text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFFFFFFF), // White background for input fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC), // Light Gray border
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC), // Light Gray border
          ),
        ),
        hintStyle: TextStyle(
          color: Color(0xFF9E9E9E), // Light Gray hint text
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Color(0xFF2196F3), // Bright Green for progress indicators
      ),
    );

    /*return ThemeData(
      // Defining the ColorScheme using AppColors
      colorScheme: const ColorScheme(
        primary: AppColors.primary, // Soft Blue
        secondary: AppColors.success, // Bright Green for success actions
        surface: AppColors.background, // White for surface areas (e.g., cards)
        onPrimary: AppColors.primaryContrast, // White text on primary elements
        onSecondary: AppColors.primaryContrast, // White text on secondary elements
        error: AppColors.error, // Soft Red for errors
        onError: AppColors.primaryContrast, // White text on error elements
        onSurface: AppColors.textColor, // Dark Gray for text on surfaces
        brightness: Brightness.light, // Define light theme
      ),

      scaffoldBackgroundColor: AppColors.background, // Set background color

      // App bar theme using AppColors
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary, // Soft Blue AppBar
        titleTextStyle: TextStyle(
          color: AppColors.primaryContrast, // White text on AppBar
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: AppColors.primaryContrast), // White icons in AppBar
      ),

      // Button theme using AppColors
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, // Soft Blue for buttons
          foregroundColor: AppColors.primaryContrast, // White text on buttons
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Floating Action Button theme using AppColors
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary, // Soft Blue FAB
        foregroundColor: AppColors.primaryContrast, // White icon
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface, // White for bottom navigation bar
        selectedItemColor: AppColors.primary, // Soft Blue for selected items
        unselectedItemColor: AppColors.secondaryText, // Light Gray for unselected items
      ),

      // Input decoration theme for text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface, // White background for input fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.secondaryText, // Light Gray border
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.secondaryText, // Light Gray border
          ),
        ),
        hintStyle: const TextStyle(
          color: AppColors.secondaryText, // Light Gray hint text
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.success, // Bright Green for progress indicators
      ),
    );*/
  }

  ThemeData darkMode() {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: AppColorsDark.primary,
        secondary: AppColorsDark.success,
        surface: AppColorsDark.surface,
        onPrimary: AppColorsDark.primaryContrast,
        onSecondary: AppColorsDark.primaryContrast,
        error: AppColorsDark.error,
        onError: AppColorsDark.primaryContrast,
        onSurface: AppColorsDark.textColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColorsDark.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorsDark.primary,
        titleTextStyle: TextStyle(
          color: AppColorsDark.primaryContrast,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: AppColorsDark.primaryContrast),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsDark.primary,
          foregroundColor: AppColorsDark.primaryContrast,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorsDark.primary,
        foregroundColor: AppColorsDark.primaryContrast,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColorsDark.surface,
        selectedItemColor: AppColorsDark.primary,
        unselectedItemColor: AppColorsDark.secondaryText,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorsDark.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColorsDark.secondaryText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColorsDark.secondaryText,
          ),
        ),
        hintStyle: const TextStyle(
          color: AppColorsDark.secondaryText,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsDark.success,
      ),
    );
  }


}