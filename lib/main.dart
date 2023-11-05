import 'package:clynamic/app/alert.dart';
import 'package:clynamic/app/client.dart';
import 'package:clynamic/app/errors.dart';
import 'package:clynamic/app/info.dart';
import 'package:clynamic/app/layout.dart';
import 'package:clynamic/project/project.dart';
import 'package:clynamic/project/tile.dart';
import 'package:clynamic/user/profile.dart';
import 'package:clynamic/user/user.dart';
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<User>? _user;
  Future<List<Project>>? _projects;

  final User _mockUser = const User(
    id: 1,
    name: 'John Doe',
    email: 'john.doe@mail.com',
    pronouns: 'he/him',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed vitae eros quis nisl aliquam aliquet. '
        'Sed euism',
    discord: 'johndoe#1234',
    github: 'johndoe',
  );

  final List<Project> _mockProjects = [
    for (int i = 0; i < 3; i++)
      GithubProject(
        id: i,
        name: 'Project $i',
        owner: 'johndoe',
        repo: 'johndoe/project-$i',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        stars: i * 100,
        lastCommit: DateTime.now(),
        homepage: 'https://example.com',
        language: 'Dart',
        banner: null,
      ),
  ];

  @override
  void initState() {
    super.initState();
    Client client = ClientProvider.of(context);
    _user = client.user(1);
    _user!.then((value) => value, onError: (error, trace) {
      if (error is! ClientException) {
        throw error;
      }
    });
    _projects = client.projects(page: 1, user: 1);
    _projects!.then((value) => value, onError: (error, trace) {
      if (error is! ClientException) {
        throw error;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FutureBuilder(
      future: _user,
      builder: (context, userSnapshot) {
        User user = userSnapshot.data ?? _mockUser;
        bool userIsReady = userSnapshot.connectionState == ConnectionState.done;
        bool userError = userSnapshot.hasError;
        return FutureBuilder(
          future: _projects,
          builder: (context, projectsSnapshot) {
            List<Project> projects = projectsSnapshot.data ?? _mockProjects;
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
                          // Only show this if we are in the single column layout
                          /*
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  'Projects',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          */
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
