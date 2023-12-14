import 'package:flutter/material.dart';

class TwoPieceLayout extends StatelessWidget {
  const TwoPieceLayout({
    super.key,
    required this.primary,
    required this.secondary,
  });

  final List<Widget> primary;
  final List<Widget> secondary;

  static bool isCombined(BuildContext context) {
    final data =
        context.dependOnInheritedWidgetOfExactType<_TwoPieceLayoutData>();
    if (data == null) throw Exception('No TwoPieceLayout found in context');
    return data.isCombined;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        List<Widget> left = [];
        List<Widget> right = [];

        bool isCombined = constraints.maxWidth < 1000;

        if (isCombined) {
          left.addAll([
            Row(
              children: [
                ...primary,
              ],
            ),
            ...secondary,
          ]);
        } else {
          left.addAll(secondary);
          right.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: VerticalDivider(),
                  ),
                  ...primary,
                ],
              ),
            ),
          );
        }

        return _TwoPieceLayoutData(
          isCombined: isCombined,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: left,
                ),
              ),
              if (right.isNotEmpty)
                SizedBox(
                  width: constraints.maxWidth > 1400 ? 600 : 420,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: right,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TwoPieceLayoutData extends InheritedWidget {
  const _TwoPieceLayoutData({
    required this.isCombined,
    required super.child,
  });

  final bool isCombined;

  @override
  bool updateShouldNotify(covariant _TwoPieceLayoutData oldWidget) =>
      isCombined != oldWidget.isCombined;
}
