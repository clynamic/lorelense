import 'package:cached_network_image/cached_network_image.dart';
import 'package:clynamic/api/api.dart';
import 'package:clynamic/app/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:relative_time/relative_time.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          width: 400,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => launchUrlString(project.source),
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
                        ProjectDescription(project: project),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
    required this.project,
  });

  final Project project;

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
            if (project.website case final website?)
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => launchUrlString(website),
                child: ProjectProperty(
                  label: Text(Uri.parse(website).host),
                  icon: const Icon(Icons.public),
                ),
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
              if (project.updated case final updated?)
                ProjectProperty(
                  label: Text(
                    RelativeTime.locale(const Locale('en')).format(updated),
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

final class ListTileMenuItem<T> extends ContextMenuItem<T> {
  const ListTileMenuItem({
    super.value,
    super.onSelected,
    this.leading,
    required this.title,
  });

  const ListTileMenuItem.submenu({
    this.leading,
    required this.title,
    required List<ContextMenuEntry> super.items,
    super.onSelected,
  }) : super.submenu();

  final Widget? leading;
  final Widget title;

  @override
  Widget builder(
    BuildContext context,
    ContextMenuState menuState, [
    FocusNode? focusNode,
  ]) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: 300,
        child: ListTile(
          leading: leading,
          title: title,
          trailing: isSubmenuItem ? const Icon(Icons.arrow_right) : null,
          onTap: () => handleItemSelection(context),
        ),
      ),
    );
  }
}
