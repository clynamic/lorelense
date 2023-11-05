import 'package:clynamic/project/project.dart';
import 'package:clynamic/project/tile.dart';
import 'package:flutter/material.dart';
import 'package:relative_time/relative_time.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GithubProjectTile extends StatelessWidget {
  const GithubProjectTile({
    super.key,
    required this.project,
  });

  final GithubProject project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: project.homepage != null
          ? () => launchUrlString(project.homepage!)
          : () => launchUrlString('https://github.com/${project.repo}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProjectBanner(url: project.banner),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                GithubProjectDescription(project: project),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GithubProjectDescription extends StatelessWidget {
  const GithubProjectDescription({
    super.key,
    required this.project,
  });

  final GithubProject project;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (project.description case final description?)
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        const SizedBox(height: 8),
        Wrap(
          children: [
            if (project.homepage case final homepage?)
              ProjectProperty(
                label: Text(Uri.parse(homepage).host),
                icon: const Icon(Icons.link),
              ),
            if (project.language case final language?)
              ProjectProperty(
                label: Text(language),
                icon: const Icon(Icons.code),
              ),
            ...[
              ProjectProperty(
                label: Text('${project.stars} stars'),
                icon: const Icon(Icons.star),
              ),
              if (project.lastCommit case final lastCommit)
                ProjectProperty(
                  label: Text(
                    RelativeTime.locale(const Locale('en')).format(lastCommit),
                  ),
                  icon: const Icon(Icons.access_time),
                ),
            ],
          ],
        )
      ],
    );
  }
}
