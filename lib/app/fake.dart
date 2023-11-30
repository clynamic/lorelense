import 'package:clynamic/client/models/github_project.dart';
import 'package:clynamic/client/models/project.dart';
import 'package:clynamic/client/models/user.dart';

const User mockUser = User(
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

final List<Project> mockProjects = [
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
    ),
];
