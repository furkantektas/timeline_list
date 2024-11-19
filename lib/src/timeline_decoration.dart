import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';

// A custom decoration that handles drawing the connecting lines between timeline
// markers.
class TimelineDecoration extends Decoration {
  /// Properties that define the timeline's visual appearance.
  final TimelineProperties properties;

  /// Whether this decoration is for the first marker in the timeline.
  final bool isFirst;

  /// Whether this decoration is for the last marker in the timeline.
  final bool isLast;

  /// How the marker's icon should be aligned relative to its content.
  final MarkerIconAlignment iconAlignment;

  /// The size of the marker's icon.
  final double iconSize;

  /// Creates a new [TimelineDecoration].
  ///
  /// All parameters are required to properly render the timeline connections.
  TimelineDecoration({
    required this.properties,
    required this.isFirst,
    required this.isLast,
    required this.iconAlignment,
    required this.iconSize,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TimelineBoxPainter(
      isFirst: isFirst,
      isLast: isLast,
      properties: properties,
      iconAlignment: iconAlignment,
      iconSize: iconSize,
    );
  }
}

/// A custom box painter that handles the actual drawing of timeline connections
/// between markers.
///
/// This painter draws the connecting lines between timeline markers based on the
/// timeline's position (start, end, center) and handles special cases for first
/// and last markers.
class _TimelineBoxPainter extends BoxPainter {
  /// Paint object used for drawing the timeline lines.
  final Paint linePaint;

  /// Whether this is the first marker in the timeline.
  final bool isFirst;

  /// Whether this is the last marker in the timeline.
  final bool isLast;

  /// Properties that holds the timeline's visual appearance.
  final TimelineProperties properties;

  /// How the marker's icon should be aligned relative to its content.
  final MarkerIconAlignment iconAlignment;

  /// The size of the marker's icon.
  final double iconSize;

  /// Creates a new box painter with the specified properties.
  ///
  /// Initializes the line paint with the timeline's color and style settings.
  _TimelineBoxPainter({
    required this.properties,
    required this.isFirst,
    required this.isLast,
    required this.iconAlignment,
    required this.iconSize,
  }) : linePaint = Paint()
          ..color = properties.lineColor
          ..strokeCap = StrokeCap.butt
          ..strokeWidth = properties.lineWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    switch (properties.timelinePosition) {
      case TimelinePosition.start:
        drawLineOnLeft(canvas, offset, configuration);
        break;
      case TimelinePosition.end:
        drawLineOnRight(canvas, offset, configuration);
        break;
      case TimelinePosition.center:
        drawLineOnCenter(canvas, offset, configuration);
        break;
    }
  }

  /// Draws the timeline line for center-positioned timelines.
  void drawLineOnCenter(
      Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;
    offset =
        offset.translate(0, properties.iconSize / 2 - properties.markerGap);
    if (!isFirst && !isLast) {
      // Draw a straight line from top to bottom
      canvas.drawLine(
          size.topCenter(offset - Offset(0, properties.iconSize / 2)),
          size.bottomCenter(offset + Offset(0, properties.iconSize / 2)),
          linePaint);
    } else {
      // Stop drawing the line if it's the first or last item
      final Offset iconOffset = switch (iconAlignment) {
        MarkerIconAlignment.top => size.topCenter(offset),
        MarkerIconAlignment.center => size.center(offset),
        MarkerIconAlignment.bottom => size.bottomCenter(offset)
      };

      final Offset top = size.topCenter(offset);
      final Offset end = size.bottomCenter(offset);

      // Draw a line from top to icon
      if (!isFirst) {
        canvas.drawLine(top, iconOffset, linePaint);
      }
      // Draw a line from icon to end
      if (!isLast) {
        canvas.drawLine(iconOffset, end, linePaint);
      }
    }
  }

  /// Draws the timeline line for left-positioned timelines.
  void drawLineOnLeft(
      Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;
    offset = offset.translate(properties.iconSize / 2,
        properties.iconSize / 2 - properties.markerGap / 2);
    if (!isFirst && !isLast) {
      // Draw a straight line from top to bottom
      canvas.drawLine(
          size.topLeft(offset - Offset(0, properties.iconSize / 2 + 8)),
          size.bottomLeft(offset + Offset(0, properties.iconSize / 2 - 2)),
          linePaint);
    } else {
      // Stop drawing the line if it's the first or last item
      final Offset iconOffset = switch (iconAlignment) {
        MarkerIconAlignment.top => size.topLeft(offset),
        MarkerIconAlignment.center => size.centerLeft(offset),
        MarkerIconAlignment.bottom => size.bottomLeft(offset)
      };

      final Offset top =
          size.topLeft(offset - Offset(0, properties.iconSize / 2 + 2));
      final Offset end =
          size.bottomLeft(offset + Offset(0, properties.iconSize / 2 - 2));

      // Draw a line from top to icon
      if (!isFirst) {
        canvas.drawLine(top, iconOffset, linePaint);
      }
      // Draw a line from icon to end
      if (!isLast) {
        canvas.drawLine(iconOffset, end, linePaint);
      }
    }
  }

  /// Draws the timeline line for right-positioned timelines.
  void drawLineOnRight(
      Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;
    offset = offset.translate(-properties.iconSize / 2,
        -properties.iconSize / 2 + properties.markerGap);
    if (!isFirst && !isLast) {
      // Draw a straight line from top to bottom
      canvas.drawLine(
          size.topRight(offset - Offset(0, properties.iconSize / 2 - 3)),
          size.bottomRight(offset + Offset(0, properties.iconSize / 2 + 3)),
          linePaint);
    } else {
      // Stop drawing the line if it's the first or last item
      final Offset iconOffset = switch (iconAlignment) {
        MarkerIconAlignment.top => size.topRight(offset),
        MarkerIconAlignment.center => size.centerRight(offset),
        MarkerIconAlignment.bottom => size.bottomRight(offset)
      };

      final Offset top = size.topRight(offset - Offset(0, 2));
      final Offset end = size.bottomRight(offset + Offset(0, 2));

      // Draw a line from top to icon
      if (!isFirst) {
        canvas.drawLine(top, iconOffset, linePaint);
      }
      // Draw a line from icon to end
      if (!isLast) {
        canvas.drawLine(iconOffset, end, linePaint);
      }
    }
  }
}
