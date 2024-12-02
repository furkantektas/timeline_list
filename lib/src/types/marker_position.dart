import 'package:flutter/widgets.dart';

/// Represents the position of the individual marker of a timeline when the
/// timeline is centered.
///
/// The marker position is ignored when the timeline is not centered.
enum MarkerPosition {
  left,
  right;

  AlignmentGeometry asAlignmentGeometry() => switch (this) {
        MarkerPosition.left => Alignment.centerLeft,
        MarkerPosition.right => Alignment.centerRight,
      };

  CrossAxisAlignment asCrossAxisAlignment() => switch (this) {
        MarkerPosition.left => CrossAxisAlignment.start,
        MarkerPosition.right => CrossAxisAlignment.end
      };

  bool isLeft() => this == MarkerPosition.left;
}
