import 'package:clynamic/assets.dart';
import 'package:clynamic/profile.dart';
import 'package:clynamic/project.dart';

const Assets assets = Assets(
  appIcon: 'assets/logo.png',
  header: 'assets/banner.png',
);

const User user = User(
  name: 'dragon',
  email: 'clragon@clynamic.net',
  pronouns: 'he/him',
  bio: 'I am dragon,\n'
      'a 23 year old software developer from Europe.\n\n'
      'I work as a web developer, but I also really like flutter!\n'
      'In my free time I enjoy video games and fantasy books.',
  discord: 'clragon#0001',
  github: 'clragon',
);

const List<Project> projects = [
  RemoteProject(
    title: 'e1547',
    url: 'clragon/e1547',
    type: ProjectType.github,
  ),
];
