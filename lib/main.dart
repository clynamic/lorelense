import 'package:clynamic/app/alert.dart';
import 'package:clynamic/app/errors.dart';
import 'package:clynamic/app/fake.dart';
import 'package:clynamic/app/info.dart';
import 'package:clynamic/app/layout.dart';
import 'package:clynamic/app/provider.dart';
import 'package:clynamic/client/api.dart';
import 'package:clynamic/project/tile.dart';
import 'package:clynamic/user/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
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

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  RestClient client = RestClient(
    Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/',
        headers: {
          'User-Agent': 'lorelense/1.0.0+1',
        },
      ),
    ),
  );

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<User>? _user;
  Future<List<Project>>? _projects;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    AlertState alerts = Alerts.of(context);
    RestClient client = ClientProvider.read(context);
    _user = client.users.getUsersId(id: 1);
    _projects = client.projects.getProjects(page: 1, user: 1);
    try {
      await _user;
      await _projects;
    } on DioException catch (e) {
      alerts.add(Alert.error(message: Text(e.message ?? 'Unknown error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FutureBuilder(
      future: _user,
      builder: (context, userSnapshot) {
        User user = userSnapshot.data ?? mockUser;
        bool userIsReady = userSnapshot.connectionState == ConnectionState.done;
        bool userError = userSnapshot.hasError;
        return FutureBuilder(
          future: _projects,
          builder: (context, projectsSnapshot) {
            List<Project> projects = projectsSnapshot.data ?? mockProjects;
            bool projectsAreReady =
                projectsSnapshot.connectionState == ConnectionState.done &&
                    projectsSnapshot.hasData;
            bool projectsError = projectsSnapshot.hasError;
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      child: TwoPieceLayout(
                        primary: [
                          if (userError)
                            ErrorIcon(
                              child: Text(
                                'Failed to load user',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            )
                          else
                            Expanded(
                              child: Skeletonizer(
                                enabled: !userIsReady,
                                child: Profile(user: user),
                              ),
                            ),
                        ],
                        secondary: [
                          Builder(builder: (context) {
                            if (TwoPieceLayout.isCombined(context)) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Projects',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                          if (projectsError)
                            ErrorIcon(
                              child: Text(
                                'Failed to load projects',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            )
                          else if (projects.isEmpty)
                            Padding(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                'No projects here...',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.5),
                                ),
                              ),
                            )
                          else ...[
                            for (final project in projects)
                              Skeletonizer(
                                enabled: !projectsAreReady,
                                child: ProjectTile(project: project),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                'And more, some day...',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ErrorIcon extends StatelessWidget {
  const ErrorIcon({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 8),
            DefaultTextStyle(
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.error,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
