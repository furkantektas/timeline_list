import 'dart:ui';

import '../timeline_list.dart';

class TimelineProperties {
  final double itemGap;
  final double iconGap;
  final double lineWidth;
  final Color lineColor;
  final double iconSize; // icon is assumed to be square
  final MarkerIconAlignment iconAlignment;
  final TimelinePosition timelinePosition;

  /// A class that holds the properties for a timeline item.
  ///
  /// This class encapsulates various properties that define the appearance
  /// and behavior of the timeline, including gaps between items, the gap
  /// between the icon and the timeline item, the width of the line connecting
  /// the timeline items, the size of the icon, the color of the line, the
  /// alignment of the icon, and the position of the timeline.
  ///
  /// By default, the icon size is 0, which means the icon is not displayed. In
  /// this case, a small circle with double the line width is displayed instead.
  const TimelineProperties({
    /// The gap between items in the timeline.
    this.itemGap = 16,

    /// The gap between the icon and the timeline item.
    this.iconGap = 12,

    /// The width of the line connecting the timeline items.
    this.lineWidth = 2,

    /// The size of the icon, assumed to be square. By default, the icon size is
    /// twice the line width.
    double? iconSize,

    /// The color of the line connecting the timeline items.
    this.lineColor = const Color.fromARGB(255, 163, 163, 168),

    /// The alignment of the icon relative to the timeline item (top, center,
    /// or bottom), by default the icon is aligned at the top.
    this.iconAlignment = MarkerIconAlignment.top,

    /// The position of the timeline (left, center, or right), by default the
    /// timeline is centered. Note that the timeline item position is
    /// ignored when timelinePosition is left or right.
    this.timelinePosition = TimelinePosition.center,
  }) : iconSize = iconSize ?? 2 * lineWidth;
}
