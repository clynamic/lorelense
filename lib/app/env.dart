import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

@immutable
class Environment {
  const Environment({required this.apiUrl});

  static Environment? _instance;

  static Environment get instance {
    if (_instance == null) {
      throw Exception('Environment not initialized');
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    _instance = await load();
  }

  static Future<Environment> load() async {
    // It is unreal how terrible the internals of the flutter_dotenv package are.
    // But I am not going to write my own dotenv parser.
    dotenv = DotEnv();
    await dotenv.load(fileName: 'dotenv');
    List<String> required = _params.keys.where((key) => _params[key]!).toList();
    for (final param in required) {
      if (!dotenv.isEveryDefined([param])) {
        throw EnvironmentException(param);
      }
    }
    List<String> params = _params.keys.toList();

    return Environment(
      apiUrl: dotenv.env[params[0]]!,
    );
  }

  static const Map<String, bool> _params = {
    'API_URL': false,
  };

  final String? apiUrl;
}

class EnvironmentException implements Exception {
  EnvironmentException(this.param);

  final String param;

  @override
  String toString() => 'Missing environment variable: $param';
}
