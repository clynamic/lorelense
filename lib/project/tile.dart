import 'package:cached_network_image/cached_network_image.dart';
import 'package:clynamic/app/banner.dart';
import 'package:clynamic/client/models/github_project.dart';
import 'package:clynamic/client/models/project.dart';
import 'package:clynamic/project/github.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: switch (project) {
            GithubProject() => GithubProjectTile(
                project: project as GithubProject,
              ),
            _ => throw UnimplementedError(),
          },
        ),
      ),
    );
  }
}

class ProjectBanner extends StatelessWidget {
  const ProjectBanner({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Skeleton.replace(
        child: switch (url) {
          null => Center(
              child: Icon(
                Icons.hide_image,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          _ => BannerImage(
              image: CachedNetworkImageProvider(url!),
            ),
        },
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodySmall!,
        child: IconTheme(
          data: Theme.of(context).iconTheme.copyWith(size: 16),
          child: Row(
            textBaseline: TextBaseline.alphabetic,
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
