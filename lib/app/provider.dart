import 'package:clynamic/client/api.dart';
import 'package:flutter/material.dart';

class ClientProvider extends InheritedWidget {
  const ClientProvider({
    super.key,
    required this.client,
    required super.child,
  });

  static T read<T extends RestClient?>(BuildContext context) =>
      context.getInheritedWidgetOfExactType<ClientProvider>()?.client as T;

  static T watch<T extends RestClient?>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ClientProvider>()?.client as T;

  final RestClient client;

  @override
  bool updateShouldNotify(covariant ClientProvider oldWidget) =>
      oldWidget.client != client;
}
