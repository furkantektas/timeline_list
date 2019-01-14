library timeline;

import 'package:flutter/material.dart';
import 'package:timeline/src/timeline_item.dart';
import 'package:timeline/src/timeline_painter.dart';
import 'package:timeline/timeline_model.dart';

typedef IndexedTimelineModelBuilder = TimelineModel Function(
    BuildContext context, int index);

enum TimelinePosition { Left, Center, Right }

class TimelineProperties {
  final Color lineColor;
  final double lineWidth;
  final double iconSize;

  const TimelineProperties(
      {this.lineColor = const Color(0xFF333333),
      this.lineWidth = 4.0,
      iconSize})
      : iconSize = iconSize ?? TimelineBoxDecoration.DEFAULT_ICON_SIZE;
}

class Timeline extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final IndexedTimelineModelBuilder itemBuilder;
  final int itemCount;
  final TimelinePosition position;
  final TimelineProperties properties;

  /// Creates a scrollable timeline of widgets that are created on demand.
  /// Note: `itemBuilder` position and [TimelineModel.icon]'s size is ignored
  /// when `position` is not [TimelinePosition.Center].
  Timeline.builder(
      {@required this.itemBuilder,
      this.itemCount,
      lineColor,
      lineWidth,
      iconSize,
      this.position = TimelinePosition.Center})
      : properties = TimelineProperties(
            lineColor: lineColor, lineWidth: lineWidth, iconSize: iconSize);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        controller: controller,
        itemBuilder: (context, i) {
          final TimelineModel model = itemBuilder(context, i);
          model.isFirst = i == 0;
          model.isLast = i == (itemCount - 1);
          switch (position) {
            case TimelinePosition.Left:
              return TimelineItemLeft(properties: properties, model: model);
            case TimelinePosition.Right:
              return TimelineItemRight(properties: properties, model: model);
            case TimelinePosition.Center:
            default:
              return TimelineItemCenter(properties: properties, model: model);
          }
        });
  }
}
