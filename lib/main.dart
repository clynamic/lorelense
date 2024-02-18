import 'package:clynamic/api/api.dart';
import 'package:clynamic/app/alert.dart';
import 'package:clynamic/app/env.dart';
import 'package:clynamic/app/errors.dart';
import 'package:clynamic/app/home.dart';
import 'package:clynamic/app/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  await Environment.initialize();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static const String defaultHost = 'http://localhost:8080';
  final GlobalKey<AlertState> _alerts = GlobalKey<AlertState>();
  late RestClient client;

  @override
  void initState() {
    super.initState();
    registerFlutterErrorHandler(
      (error, trace) => _alerts.currentState?.add(
        Alert.error(message: Text(error.toString())),
      ),
    );

    client = RestClient(
      Dio(
        BaseOptions(
          baseUrl: Environment.instance.apiUrl ?? defaultHost,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
    return MaterialApp(
      theme: theme.copyWith(
        applyElevationOverlayColor: false,
        splashColor: theme.colorScheme.surfaceTint.withOpacity(0.6),
        hoverColor: theme.colorScheme.surfaceTint.withOpacity(0.1),
        highlightColor: theme.colorScheme.surfaceTint.withOpacity(0.3),
        cardTheme: theme.cardTheme.copyWith(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      builder: (context, child) => ClientProvider(
        client: client,
        child: Alerts(
          key: _alerts,
          child: child!,
        ),
      ),
      home: const Home(),
    );
  }
}
