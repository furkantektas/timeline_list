library timeline;

import 'package:flutter/material.dart';
import 'package:timeline_list/src/timeline_item.dart';
import 'package:timeline_list/src/timeline_painter.dart';
import 'package:timeline_list/timeline_model.dart';

typedef IndexedTimelineModelBuilder = TimelineModel Function(
    BuildContext context, int index);

enum TimelinePosition { Left, Center, Right }

class TimelineProperties {
  final Color lineColor;
  final double lineWidth;
  final double iconSize;
  final double gap;

  const TimelineProperties({Color? lineColor, double? lineWidth, double? iconSize, double? gap})
      : lineColor = lineColor ?? const Color(0xFF333333),
        lineWidth = lineWidth ?? 2.5,
        iconSize = iconSize ?? TimelineBoxDecoration.DEFAULT_ICON_SIZE,
        gap = gap ?? 0.0;
}

class Timeline extends StatelessWidget {
  final ScrollController? controller;
  final IndexedTimelineModelBuilder itemBuilder;
  final int itemCount;
  final TimelinePosition position;
  final TimelineProperties properties;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  /// Creates a scrollable timeline of widgets that are created befirehand.
  /// Note: [TimelineModel.icon]'s size is ignored when `position` is not
  /// [TimelinePosition.Center].
  Timeline(
      {required List<TimelineModel> children,
      Color? lineColor,
      double? lineWidth,
      double? iconSize,
      double? gap,
      this.controller,
      this.position = TimelinePosition.Center,
      this.physics,
      this.shrinkWrap = false,
      this.primary = false,
      this.reverse = false})
      : itemCount = children.length,
        properties = TimelineProperties(
            lineColor: lineColor, lineWidth: lineWidth, iconSize: iconSize, gap: gap),
        itemBuilder = ((BuildContext context, int i) => children[i]);

  /// Creates a scrollable timeline of widgets that are created on demand.
  /// Note: `itemBuilder` position and [TimelineModel.icon]'s size is ignored
  /// when `position` is not [TimelinePosition.Center].
  Timeline.builder(
      {required this.itemBuilder,
        required this.itemCount,
      this.controller,
      Color? lineColor,
      double? lineWidth,
      double? iconSize,
      double? gap,
      this.position = TimelinePosition.Center,
      this.physics,
      this.shrinkWrap = false,
      this.primary = false,
      this.reverse = false})
      : properties = TimelineProperties(
            lineColor: lineColor, lineWidth: lineWidth, iconSize: iconSize, gap: gap);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        controller: controller,
        reverse: reverse,
        primary: primary,
        itemBuilder: (context, i) {
          final TimelineModel model = itemBuilder(context, i);
          model.isFirst = reverse ? i == (itemCount - 1) : i == 0;
          model.isLast = reverse ? i == 0 : i == (itemCount - 1);

          final child = positionBuilder[position]!;

          return Material(
            child: InkWell(
              onTap: model.onTap as void Function()?,
              child: Container(child: child(properties, model), margin: EdgeInsets.only(bottom: properties.gap)),
            ),
          );
        });
  }
}

final positionBuilder = {
  TimelinePosition.Left: (
    TimelineProperties properties,
    TimelineModel model,
  ) =>
      TimelineItemLeft(
        properties: properties,
        model: model,
      ),
  TimelinePosition.Right: (
    TimelineProperties properties,
    TimelineModel model,
  ) =>
      TimelineItemRight(
        properties: properties,
        model: model,
      ),
  TimelinePosition.Center: (
    TimelineProperties properties,
    TimelineModel model,
  ) =>
      TimelineItemCenter(
        properties: properties,
        model: model,
      ),
};
