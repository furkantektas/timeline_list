import 'package:flutter/widgets.dart';

/// Defines the vertical alignment of a marker's icon relative to its content.
///
/// This enum provides three alignment options for positioning the icon:
/// - [top]: Aligns the icon at the top of the marker's content
/// - [center]: Centers the icon vertically relative to the marker's content
/// - [bottom]: Aligns the icon at the bottom of the marker's content
enum MarkerIconAlignment {
  /// Aligns the icon at the top of the marker's content.
  top,

  /// Centers the icon vertically relative to the marker's content.
  center,

  /// Aligns the icon at the bottom of the marker's content.
  bottom;

  /// Converts the alignment to a Flutter [AlignmentGeometry] value.
  ///
  /// This is used internally for positioning the icon within its container.
  AlignmentGeometry asAlignmentGeometry() => switch (this) {
        MarkerIconAlignment.top => Alignment.topCenter,
        MarkerIconAlignment.center => Alignment.center,
        MarkerIconAlignment.bottom => Alignment.bottomCenter,
      };

  /// Converts the alignment to a Flutter [CrossAxisAlignment] value.
  ///
  /// This is used internally for positioning the icon within row or column layouts.
  CrossAxisAlignment asCrossAxisAlignment() => switch (this) {
        MarkerIconAlignment.top => CrossAxisAlignment.start,
        MarkerIconAlignment.center => CrossAxisAlignment.center,
        MarkerIconAlignment.bottom => CrossAxisAlignment.end,
      };
}
