import 'dart:ui';

import '../../timeline_list.dart';

class TimelineProperties {
  final double markerGap;
  final double iconGap;
  final double lineWidth;
  final Color lineColor;
  final double iconSize; // icon is assumed to be square
  final MarkerIconAlignment iconAlignment;
  final TimelinePosition timelinePosition;

  /// A class that holds the properties for a timeline item.
  ///
  /// This class encapsulates various properties that define the appearance
  /// and behavior of the timeline, including gaps between markers, the gap
  /// between the icon and the marker, the width of the line connecting the
  /// markers, the size of the icon, the color of the line, the alignment of the
  /// icon, and the position of the timeline.
  ///
  /// If no icon is provided in the marker, a small circle with double the line
  /// width is displayed instead.
  const TimelineProperties({
    /// The gap between markers in the timeline.
    this.markerGap = 16,

    /// The gap between the icon and the timeline item.
    this.iconGap = 12,

    /// The width of the line connecting the timeline markers.
    this.lineWidth = 2,

    /// The size of the icon, assumed to be square. By default, the icon size is
    /// twice the line width.
    double? iconSize,

    /// The color of the line connecting the timeline items.
    this.lineColor = const Color.fromARGB(255, 163, 163, 168),

    /// The alignment of the icon relative to the timeline item (top, center,
    /// or bottom), by default the icon is aligned at the top.
    this.iconAlignment = MarkerIconAlignment.center,

    /// The position of the timeline (start(left), center, end(right)), by
    /// default the timeline is left aligned. Note that the timeline item
    /// position is ignored when timelinePosition is left or right.
    this.timelinePosition = TimelinePosition.start,
  }) : iconSize = iconSize ?? 2 * lineWidth;
}
