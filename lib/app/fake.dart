import 'package:clynamic/api/api.dart';

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
    Project(
      id: i,
      name: 'Project $i',
      source: 'https://johndoe/project-$i',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      stars: i * 100,
      updated: DateTime.now(),
      website: 'https://example.com',
      language: 'Dart',
    ),
];
