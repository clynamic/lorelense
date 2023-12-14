import 'package:clynamic/client/models/github_project.dart';
import 'package:clynamic/project/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    String githubUrl = 'https://github.com/${project.owner}/${project.repo}';

    void showMenu(Offset position) => showContextMenu<VoidCallback?>(
          context,
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          contextMenu: ContextMenu(
            position: position,
            entries: [
              ListTileMenuItem(
                leading: const FaIcon(FontAwesomeIcons.github),
                title: const Text('Open GitHub page'),
                onSelected: () => launchUrlString(githubUrl),
              ),
            ],
          ),
        );

    return GestureDetector(
      onLongPressStart: [
        TargetPlatform.iOS,
        TargetPlatform.android,
      ].contains(Theme.of(context).platform)
          ? (details) => showMenu(details.globalPosition)
          : null,
      onSecondaryTapDown: (details) => showMenu(details.globalPosition),
      child: InkWell(
        onTap: project.homepage != null
            ? () => launchUrlString(project.homepage!)
            : () => launchUrlString(githubUrl),
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
              if (project.lastCommit case final lastCommit?)
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
