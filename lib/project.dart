import 'package:cached_network_image/cached_network_image.dart';
import 'package:clynamic/banner.dart';
import 'package:clynamic/client.dart';
import 'package:flutter/material.dart';
import 'package:relative_time/relative_time.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum LoadingState {
  loading,
  done,
  error,
}

enum ProjectType {
  github,
}

@immutable
sealed class Project {
  const Project();

  String get title;
}

class RemoteProject implements Project {
  const RemoteProject({
    required this.title,
    required this.url,
    required this.type,
  });

  @override
  final String title;
  final String url;
  final ProjectType type;
}

abstract class FullProject implements Project {
  @override
  String get title;
  String get description;
  String? get website;
  String? get language;
  String? get banner;
}

class GithubProject implements FullProject {
  GithubProject({
    required this.title,
    required this.description,
    required this.website,
    required this.language,
    required this.banner,
    required this.stars,
    required this.lastCommit,
  });

  @override
  final String title;
  @override
  final String description;
  final int stars;
  final String lastCommit;
  @override
  final String? website;
  @override
  final String? language;
  @override
  final String? banner;
}

class ProjectTile extends StatefulWidget {
  const ProjectTile({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  late Future<FullProject> resolved = resolve();

  Future<FullProject> resolve() async {
    Project project = widget.project;
    return switch (project) {
      FullProject() => Future.value(project),
      RemoteProject() => resolveRemoteProject(project),
    };
  }

  Future<FullProject> resolveRemoteProject(RemoteProject project) async {
    String url = project.url;
    switch (project.type) {
      case ProjectType.github:
        final [owner, repo] = url.split('/');
        Client client = ClientProvider.of(context);
        return client.fetchGitHubProject(owner, repo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: resolved,
      builder: (context, snapshot) {
        FullProject? project = snapshot.data;
        LoadingState state =
            snapshot.connectionState == ConnectionState.done && snapshot.hasData
                ? LoadingState.done
                : snapshot.hasError
                    ? LoadingState.error
                    : LoadingState.loading;
        return Center(
          child: SizedBox(
            width: 400,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: project?.website != null
                    ? () => launchUrlString(project!.website!)
                    : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProjectBanner(
                      project: project,
                      state: state,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            project?.title ?? widget.project.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          ProjectDescription(
                            project: project,
                            state: state,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProjectBanner extends StatelessWidget {
  const ProjectBanner({
    super.key,
    required this.project,
    required this.state,
  });

  final FullProject? project;
  final LoadingState state;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: switch (state) {
        LoadingState.done => project!.banner != null
            ? BannerImage(
                image: CachedNetworkImageProvider(
                  project!.banner!,
                ),
              )
            : Center(
                child: Icon(
                  Icons.hide_image,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
        LoadingState.loading => Shimmer.fromColors(
            baseColor: Theme.of(context).cardColor,
            highlightColor: Theme.of(context).cardColor.withOpacity(0.2),
            child: Container(
              color: Colors.white,
            ),
          ),
        LoadingState.error => Center(
            child: Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
      },
    );
  }
}

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
    required this.project,
    required this.state,
  });

  final FullProject? project;
  final LoadingState state;

  @override
  Widget build(BuildContext context) {
    FullProject? project = this.project;
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: switch (state) {
        LoadingState.done => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project!.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                children: [
                  if (project.website != null)
                    ProjectProperty(
                      label: Text(Uri.parse(project.website!).host),
                      icon: const Icon(Icons.link),
                    ),
                  if (project.language != null)
                    ProjectProperty(
                      label: Text(project.language!),
                      icon: const Icon(Icons.code),
                    ),
                  if (project is GithubProject) ...[
                    ProjectProperty(
                      label: Text('${project.stars} stars'),
                      icon: const Icon(Icons.star),
                    ),
                    ProjectProperty(
                      label: Text(
                        RelativeTime.locale(const Locale('en')).format(
                          DateTime.parse(project.lastCommit),
                        ),
                      ),
                      icon: const Icon(Icons.access_time),
                    ),
                  ],
                ],
              )
            ],
          ),
        LoadingState.loading => Shimmer.fromColors(
            baseColor: Theme.of(context).cardColor,
            highlightColor: Theme.of(context).cardColor.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        LoadingState.error => Center(
            child: Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
      },
    );
  }
}

class ProjectProperty extends StatelessWidget {
  const ProjectProperty({
    super.key,
    required this.label,
    required this.icon,
  });

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodySmall!,
        child: IconTheme(
          data: Theme.of(context).iconTheme.copyWith(
                size: 16,
              ),
          child: Row(
            textBaseline: TextBaseline.ideographic,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 4),
              label,
            ],
          ),
        ),
      ),
    );
  }
}
