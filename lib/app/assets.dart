import 'package:flutter/foundation.dart';

@immutable
class Assets {
  const Assets({
    required this.appIcon,
    required this.header,
  });

  final String appIcon;
  final String header;
}
