import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Alert {
  Alert({
    this.id,
    required this.icon,
    required this.color,
    this.duration = defaultDuration,
    required this.message,
    this.callback,
  });

  Alert.info({
    String? id,
    Duration? duration = defaultDuration,
    required Widget message,
    VoidCallback? callback,
  }) : this(
          id: id,
          icon: const Icon(Icons.info),
          color: Colors.blue,
          duration: duration,
          message: message,
          callback: callback,
        );

  Alert.success({
    String? id,
    Duration? duration = defaultDuration,
    required Widget message,
    VoidCallback? callback,
  }) : this(
          id: id,
          icon: const Icon(Icons.check_circle),
          color: Colors.green,
          duration: duration,
          message: message,
          callback: callback,
        );

  Alert.warning({
    String? id,
    Duration? duration = defaultDuration,
    required Widget message,
    VoidCallback? callback,
  }) : this(
          id: id,
          icon: const Icon(Icons.warning),
          color: Colors.orange,
          duration: duration,
          message: message,
          callback: callback,
        );

  Alert.error({
    String? id,
    Duration? duration = defaultDuration,
    required Widget message,
    VoidCallback? callback,
  }) : this(
          id: id,
          icon: const Icon(Icons.error),
          color: Colors.red,
          duration: duration,
          message: message,
          callback: callback,
        );

  static const Duration defaultDuration = Duration(seconds: 3);

  /// The ID of this alert. Can be used to update or remove this alert.
  final String? id;

  /// The icon to display on this alert.
  final Widget icon;

  /// The color of this alert. Applies to background, icon and text.
  final Color color;

  /// The duration to display this alert. If null, this alert will be displayed
  /// until it is removed.
  final Duration? duration;

  /// The message to display on this alert.
  final Widget message;

  /// The callback to call when this alert is tapped.
  /// If null, this alert will not be tappable.
  final VoidCallback? callback;
}

/// This class is used internally by [Alerts] to manage the lifetime of an
/// [Alert]. It keeps track of the remaining duration of the alert and calls
/// the callback when the duration is up.
class _AlertLifetime {
  _AlertLifetime({
    required this.alert,
    required this.callback,
  });

  final Alert alert;
  final VoidCallback callback;
  DateTime? _startTime;
  Duration? _remaining;
  Timer? _timer;

  Duration? get remainingDuration {
    if (alert.duration == null) return null;
    Duration remaining = _remaining ?? alert.duration!;
    if (_startTime == null) {
      return remaining;
    } else {
      return remaining - DateTime.now().difference(_startTime!);
    }
  }

  void start() {
    if (alert.duration == null) return;
    _timer = Timer(remainingDuration!, callback);
    _startTime = DateTime.now();
  }

  void stop() {
    if (alert.duration == null) return;
    _timer?.cancel();
    _timer = null;
    _remaining = remainingDuration;
    _startTime = null;
  }
}

class Alerts extends StatefulWidget {
  const Alerts({
    super.key,
    required this.child,
  });

  final Widget child;

  static AlertState of(BuildContext context) => maybeOf(context)!;

  static AlertState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<AlertState>();

  @override
  AlertState createState() => AlertState();
}

class AlertState extends State<Alerts> {
  final List<Alert> _alerts = [];
  final Map<Alert, _AlertLifetime> _alertLifetimes = {};
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  /// Adds an alert or updates an existing alert.
  ///
  /// If an alert with the same ID already exists, it will be replaced.
  void add(Alert alert) {
    Alert? previous = _alerts
        .where((e) => e == alert || (alert.id != null && e.id == alert.id))
        .firstOrNull;
    _AlertLifetime? lifetime = _alertLifetimes.remove(previous);
    lifetime?.stop();

    lifetime = _alertLifetimes[alert] = _AlertLifetime(
      alert: alert,
      callback: () => remove(alert),
    );
    lifetime.start();

    if (previous != null) {
      int index = _alerts.indexOf(previous);
      _alerts[index] = alert;
    } else {
      _alerts.add(alert);
      _listKey.currentState?.insertItem(_alerts.length - 1);
    }
  }

  /// Removes an alert.
  void remove(Alert alert) {
    _listKey.currentState?.setState(() {
      int index = _alerts.indexWhere((a) => identical(a, alert));
      if (index >= 0) {
        _alerts.removeAt(index);
        _alertLifetimes[alert]?.stop();
        _alertLifetimes.remove(alert);
        _listKey.currentState?.removeItem(
          index,
          (context, animation) =>
              AlertTile.withAnimation(context, animation, alert),
        );
      }
    });
  }

  /// Freezes the alert, pausing its automatic removal timer.
  void freeze(Alert alert) => _alertLifetimes[alert]?.stop();

  /// Thaws the alert, resuming its automatic removal timer.
  void thaw(Alert alert) => _alertLifetimes[alert]?.start();

  /// Returns the remaining duration of the alert.
  Duration? getRemainingDuration(Alert alert) =>
      _alertLifetimes[alert]?.remainingDuration;

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => widget.child,
        ),
        OverlayEntry(
          builder: (context) => _AlertDisplay(
            listKey: _listKey,
            alerts: _alerts,
            itemBuilder: (context, index, animation) => AlertTile.withAnimation(
              context,
              animation,
              _alerts[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _AlertDisplay extends StatefulWidget {
  const _AlertDisplay({
    required this.listKey,
    required this.itemBuilder,
    required this.alerts,
  });

  final GlobalKey<AnimatedListState> listKey;
  final AnimatedItemBuilder itemBuilder;
  final List<Alert> alerts;

  @override
  _AlertDisplayState createState() => _AlertDisplayState();
}

class _AlertDisplayState extends State<_AlertDisplay>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: AnimatedList(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            key: widget.listKey,
            initialItemCount: widget.alerts.length,
            itemBuilder: widget.itemBuilder,
          ),
        ),
      ],
    );
  }
}

/// A tile that displays an [Alert].
class AlertTile extends StatefulWidget {
  const AlertTile({
    super.key,
    required this.alert,
  });

  final Alert alert;

  static Widget withAnimation(
    BuildContext context,
    Animation<double> animation,
    Alert alert,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
        ),
        child: FadeTransition(
          opacity: animation,
          child: AlertTile(alert: alert),
        ),
      );

  @override
  State<AlertTile> createState() => _AlertTileState();
}

class _AlertTileState extends State<AlertTile>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration? _remaining;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_tick)..start();
  }

  void _tick(Duration elapsed) {
    AlertState alerts = Alerts.of(context);
    Duration? remaining = alerts.getRemainingDuration(widget.alert);
    if (_remaining != remaining) {
      setState(() {
        _remaining = remaining;
      });
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  (Color, Color) get _colors {
    HSLColor hslColor = HSLColor.fromColor(widget.alert.color);
    HSLColor lighterHSLColor =
        hslColor.withLightness((hslColor.lightness + 0.2).clamp(0.0, 1.0));
    HSLColor darkerHSLColor =
        hslColor.withLightness((hslColor.lightness - 0.2).clamp(0.0, 1.0));
    Color lighterColor = lighterHSLColor.toColor();
    Color darkerColor = darkerHSLColor.toColor();
    return (darkerColor, lighterColor);
  }

  @override
  Widget build(BuildContext context) {
    final (darkerColor, lighterColor) = _colors;
    AlertState alerts = Alerts.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: darkerColor,
        hoverColor: lighterColor,
        highlightColor: lighterColor,
      ),
      child: MouseRegion(
        onEnter: (event) => alerts.freeze(widget.alert),
        onExit: (event) => alerts.thaw(widget.alert),
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: widget.alert.color,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              ListTile(
                leading: widget.alert.icon,
                title: widget.alert.message,
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => alerts.remove(widget.alert),
                ),
                onTap: widget.alert.callback,
              ),
              if (widget.alert.duration != null && _remaining != null)
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: LinearProgressIndicator(
                    color: darkerColor,
                    backgroundColor: Colors.transparent,
                    value: _remaining!.inMilliseconds /
                        widget.alert.duration!.inMilliseconds,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
