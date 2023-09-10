import 'dart:async';

import 'package:flutter/widgets.dart';

void registerFlutterErrorHandler(
  void Function(Object error, StackTrace? trace) handler,
) {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    try {
      handler(error, stack);
    } on Object {
      // if even the error handler fails, we're in trouble
    }
    Zone.current.handleUncaughtError(error, stack);
    return false;
  };
  FlutterError.onError = (details) {
    try {
      handler(details.exception, details.stack);
    } on Object {
      // there is no god, only pain
    }
    FlutterError.presentError(details);
  };
}
