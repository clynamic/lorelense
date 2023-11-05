import 'package:flutter/material.dart';

class TwoPieceLayout extends StatelessWidget {
  const TwoPieceLayout({
    super.key,
    required this.primary,
    required this.secondary,
  });

  final List<Widget> primary;
  final List<Widget> secondary;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        List<Widget> left = [];
        List<Widget> right = [];

        if (constraints.maxWidth > 1000) {
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
        } else {
          left.addAll([
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...primary,
              ],
            ),
            ...secondary,
          ]);
        }

        return Row(
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
        );
      },
    );
  }
}
