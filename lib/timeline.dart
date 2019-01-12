library timeline;

import 'package:flutter/material.dart';
import 'package:timeline/timeline_item.dart';
import 'package:timeline/timeline_model.dart';

typedef IndexedTimelineModelBuilder = TimelineModel Function(
    BuildContext context, int index);

class Timeline extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final IndexedTimelineModelBuilder itemBuilder;
  final int itemCount;
  final Color lineColor;
  final double lineWidth;

  Timeline.builder(
      {@required this.itemBuilder,
      this.itemCount,
      this.lineColor,
      this.lineWidth,
      bool addAutomaticKeepAlives = true,
      bool addRepaintBoundaries = true,
      bool addSemanticIndexes = true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, i) {
          return TimelineItem(
              lineColor: lineColor,
              lineWidth: lineWidth,
              model: itemBuilder(context, i),
              isFirst: i == 0,
              isLast: i == (itemCount - 1));
        });
  }
}
