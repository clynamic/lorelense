import 'package:boxy/boxy.dart';
import 'package:clynamic/app/banner.dart';
import 'package:clynamic/app/info.dart';
import 'package:clynamic/user/clipboard.dart';
import 'package:clynamic/user/gravatar.dart';
import 'package:clynamic/user/quotes.dart';
import 'package:clynamic/user/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        ProfileHead(user: user),
        const SizedBox(height: 12),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (user.pronouns case final pronouns?) ...[
                const SizedBox(height: 2),
                Text(
                  pronouns,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
              if (user.bio case final bio?)
                if (bio.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(bio),
                ],
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
        if (user.github case final github?)
          SocialLink(
            username: github,
            type: SocialLinkType.github,
          ),
        if (user.discord case final discord?)
          SocialLink(
            username: discord,
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
  const ProfileHead({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
      delegate: ProfileHeadDelegate(),
      children: [
        BoxyId(
          id: #banner,
          child: SizedBox(
            height: 160,
            width: double.infinity,
            child: Opacity(
              opacity: 0.9,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: BannerImage(
                  // TODO: store header per user
                  image: AssetImage(assets.header),
                ),
              ),
            ),
          ),
        ),
        BoxyId(
          id: #avatar,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox.fromSize(
              size: const Size.square(80),
              child: GravatarImage(email: user.email),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileHeadDelegate extends BoxyDelegate {
  @override
  Size layout() {
    final banner = getChild(#banner);
    final avatar = getChild(#avatar);

    final avatarSize = avatar.layout(constraints);

    final bannerSize = banner.layout(
      constraints.copyWith(
        minHeight: avatarSize.height,
      ),
    );
    banner.position(Offset.zero);

    double halfAvatarHeight = avatarSize.height / 2;

    avatar.position(
      Offset(
        0,
        bannerSize.height - halfAvatarHeight,
      ),
    );

    return Size(
      bannerSize.width,
      bannerSize.height + halfAvatarHeight,
    );
  }

  @override
  double maxIntrinsicHeight(double width) {
    final banner = getChild(#banner);
    final avatar = getChild(#avatar);

    final avatarHeight = avatar.render.getMaxIntrinsicHeight(width);
    final bannerHeight = banner.render.getMaxIntrinsicHeight(width);
    double halfAvatarHeight = avatarHeight / 2;

    return bannerHeight + halfAvatarHeight;
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
