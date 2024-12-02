import 'package:flutter/widgets.dart';

import 'types.dart';

typedef MarkerBuilder = Marker Function(BuildContext context, int index);

/// A class that represents a marker item in a timeline.
///
/// Each marker consists of a main content [child], an optional [icon],
/// and configuration for its positioning and interaction.
class Marker {
  /// The main content widget of the marker.
  final Widget child;

  /// An optional icon widget displayed alongside the marker.
  /// If not provided, a default circular dot will be used.
  final Widget? icon;

  /// The position of the marker relative to the timeline.
  /// Defaults to [MarkerPosition.left].
  final MarkerPosition position;

  /// Callback function triggered when the marker is tapped.
  final VoidCallback? onTap;

  /// Defines how the icon should be aligned relative to the marker content.
  /// This affects the vertical alignment of the icon.
  final MarkerIconAlignment? iconAlignment;

  /// The maximum width constraint for the marker content.
  /// Defaults to [double.infinity].
  final double maxWidth;

  /// Creates a new [Marker] instance, previosly known as `TimelineItem`.
  ///
  /// The [child] parameter is required and represents the main content of the marker.
  /// Other parameters are optional and provide customization for the marker's
  /// appearance and behavior.
  Marker({
    required this.child,
    this.icon,
    this.onTap,
    this.iconAlignment,
    this.position = MarkerPosition.left,
    this.maxWidth = double.infinity,
  });

  /// Creates a copy of this [Marker] with the given fields replaced with new values.
  ///
  /// This method is useful when you need to create a new marker based on an existing one
  /// with slight modifications.
  Marker copyWith({
    Widget? child,
    Widget? icon,
    MarkerPosition? position,
    VoidCallback? onTap,
    MarkerIconAlignment? iconAlignment,
    double? maxWidth,
  }) {
    return Marker(
      child: child ?? this.child,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      iconAlignment: iconAlignment ?? this.iconAlignment,
      position: position ?? this.position,
      maxWidth: maxWidth ?? this.maxWidth,
    );
  }
}
