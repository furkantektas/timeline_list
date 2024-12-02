import 'package:flutter/widgets.dart';

/// Defines the horizontal position of the timeline within its container.
///
/// This enum provides three positioning options:
/// - [start]: Places the timeline at the start (left) of the container
/// - [center]: Centers the timeline horizontally in the container
/// - [end]: Places the timeline at the end (right) of the container
enum TimelinePosition {
  /// Places the timeline at the start (left) of the container.
  start,

  /// Centers the timeline horizontally in the container.
  center,

  /// Places the timeline at the end (right) of the container.
  end;

  /// Converts the position to a Flutter [MainAxisAlignment] value.
  ///
  /// This is used internally for positioning timeline elements within row layouts.
  MainAxisAlignment asMainAxisAlignment() => switch (this) {
        TimelinePosition.start => MainAxisAlignment.start,
        TimelinePosition.center => MainAxisAlignment.center,
        TimelinePosition.end => MainAxisAlignment.end,
      };

  /// Converts the position to a Flutter [CrossAxisAlignment] value.
  ///
  /// This is used internally for positioning timeline elements within column layouts.
  CrossAxisAlignment asCrossAxisAlignment() => switch (this) {
        TimelinePosition.start => CrossAxisAlignment.start,
        TimelinePosition.center => CrossAxisAlignment.center,
        TimelinePosition.end => CrossAxisAlignment.end,
      };
}
