import 'package:clynamic/alert.dart';
import 'package:clynamic/client.dart';
import 'package:clynamic/errors.dart';
import 'package:clynamic/info.dart';
import 'package:clynamic/profile.dart';
import 'package:clynamic/project.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

GlobalKey<AlertState> _alerts = GlobalKey<AlertState>();

void main() {
  setPathUrlStrategy();
  registerFlutterErrorHandler(
    (error, trace) => _alerts.currentState?.add(
      Alert.error(message: Text(error.toString())),
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
        child: Alerts(
          key: _alerts,
          child: child!,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      List<Widget> tiles = [
        for (final project in projects) ProjectTile(project: project),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            'And more, some day...',
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        )
      ];
      List<Widget> left = [];
      List<Widget> right = [];

      if (constraints.maxWidth > 1000) {
        left.addAll(tiles);
        right.add(
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: VerticalDivider(),
              ),
              Expanded(child: Profile(user: user)),
            ],
          ),
        );
      } else {
        left.addAll([
          const Profile(user: user),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Projects',
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          ...tiles,
        ]);
      }

      return Stack(
        fit: StackFit.passthrough,
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        assets.appIcon,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: const Text('clynamic'),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: left,
                          ),
                        ),
                        if (right.isNotEmpty)
                          SizedBox(
                            width: constraints.maxWidth > 1400 ? 600 : 420,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: right,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
