import 'dart:math';

import 'package:flutter/widgets.dart';

/// Represents the position of the individual marker of a timeline when the
/// timeline is centered.
///
/// The marker position is ignored when the timeline is not centered. When set
/// to [MarkerPosition.random], the position is chosen at runtime.
enum MarkerPosition {
  left,
  right,
  random;

  AlignmentGeometry asAlignmentGeometry() => switch (this) {
        MarkerPosition.left => Alignment.centerLeft,
        MarkerPosition.right => Alignment.centerRight,
        MarkerPosition.random =>
          (Random().nextBool()) ? Alignment.centerLeft : Alignment.centerRight,
      };

  CrossAxisAlignment asCrossAxisAlignment() => switch (this) {
        MarkerPosition.left => CrossAxisAlignment.start,
        MarkerPosition.right => CrossAxisAlignment.end,
        MarkerPosition.random => (Random().nextBool())
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
      };

  bool isLeft() => this == MarkerPosition.random
      ? Random().nextBool()
      : this == MarkerPosition.left;
}
