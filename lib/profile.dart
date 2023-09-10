import 'package:clynamic/banner.dart';
import 'package:clynamic/clipboard.dart';
import 'package:clynamic/gravatar.dart';
import 'package:clynamic/info.dart';
import 'package:clynamic/quotes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

@immutable
class User {
  const User({
    required this.name,
    required this.email,
    required this.pronouns,
    required this.bio,
    required this.discord,
    required this.github,
  });

  final String name;
  final String email;
  final String pronouns;
  final String bio;
  final String? discord;
  final String? github;
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileHead(),
        const SizedBox(height: 12),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 2),
              Text(
                user.pronouns,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Text(user.bio),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Find me',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        SocialLink(
          username: user.email,
          type: SocialLinkType.email,
        ),
        if (user.github != null)
          SocialLink(
            username: user.github!,
            type: SocialLinkType.github,
          ),
        if (user.discord != null)
          SocialLink(
            username: user.discord!,
            type: SocialLinkType.discord,
          ),
        const SizedBox(height: 24),
        Text(
          'Advice',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        const SunTzuQuote(),
      ],
    );
  }
}

class ProfileHead extends StatelessWidget {
  const ProfileHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          child: Opacity(
                            opacity: 0.9,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              child: BannerImage(
                                image: AssetImage(assets.header),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -36,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox.fromSize(
                      size: const Size.square(80),
                      child: GravatarImage(email: user.email),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}

enum SocialLinkType {
  email,
  discord,
  github,
}

class SocialLink extends StatelessWidget {
  const SocialLink({
    super.key,
    required this.username,
    required this.type,
  });

  final String username;
  final SocialLinkType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Tooltip(
        message: username,
        preferBelow: false,
        waitDuration: const Duration(milliseconds: 500),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).canvasColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: switch (type) {
            SocialLinkType.email => () => launchUrlString('mailto:$username'),
            SocialLinkType.discord => () => showDialog(
                  context: context,
                  builder: (context) => CopyUsernameDialog(username: username),
                ),
            SocialLinkType.github => () =>
                launchUrlString('https://github.com/$username'),
          },
          icon: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: Theme.of(context).iconTheme.size ?? 24 + 6,
            ),
            child: Center(
              child: FaIcon(
                switch (type) {
                  SocialLinkType.email => FontAwesomeIcons.envelope,
                  SocialLinkType.discord => FontAwesomeIcons.discord,
                  SocialLinkType.github => FontAwesomeIcons.github,
                },
              ),
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  switch (type) {
                    SocialLinkType.email => 'Email',
                    SocialLinkType.discord => 'Discord',
                    SocialLinkType.github => 'GitHub',
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
