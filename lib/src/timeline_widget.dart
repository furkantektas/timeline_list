import 'package:flutter/material.dart';
import '../timeline_list.dart';

class TimelineWidget extends StatelessWidget {
  /// The list of markers to display in the timeline.
  final List<Marker> items;

  /// Properties that define the default visual appearance of the timeline.
  final TimelineProperties properties;

  /// Optional scroll controller for the timeline list.
  final ScrollController? controller;

  /// Optional scroll physics for the timeline list.
  final ScrollPhysics? physics;

  /// Whether the timeline should shrink-wrap its contents. True by default.
  final bool shrinkWrap;

  /// Whether to reverse the order of items in the timeline.
  final bool reverse;

  /// Maximum width constraint for the timeline.
  final double maxWidth;

  /// Horizontal padding around the timeline.
  final double horizontalPadding;

  /// Default icon alignment for all markers in the timeline.
  final MarkerIconAlignment iconAlignment;

  /// Creates a new [TimelineWidget].
  ///
  /// The [items] and [properties] parameters are required.
  /// Other parameters provide additional customization options for the timeline's
  /// appearance and behavior.
  const TimelineWidget({
    super.key,
    required this.items,
    required this.properties,
    this.controller,
    this.physics,
    this.shrinkWrap = false,
    this.reverse = false,
    this.maxWidth = double.infinity,
    this.horizontalPadding = 16,
    this.iconAlignment = MarkerIconAlignment.top,
  });

  /// Builds the content for a single marker in the timeline.
  ///
  /// This method handles the positioning and alignment of markers based on the
  /// timeline's position and the marker's properties.
  Widget content(
      BuildContext context, Marker marker, bool isFirst, bool isLast) {
    final child = SizedBox(
      width: marker.maxWidth,
      child: MarkerWidget(
          data: marker.copyWith(
            iconAlignment: marker.iconAlignment ?? properties.iconAlignment,
            position: properties.timelinePosition == TimelinePosition.start
                ? MarkerPosition.left
                : (properties.timelinePosition == TimelinePosition.end
                    ? MarkerPosition.right
                    : marker.position),
          ),
          properties: properties,
          isFirst: isFirst,
          isLast: isLast),
    );
    return switch (properties.timelinePosition) {
      TimelinePosition.start =>
        Align(alignment: Alignment.centerLeft, child: child),
      TimelinePosition.end =>
        Align(alignment: Alignment.centerRight, child: child),
      _ => child,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap,
      reverse: reverse,
      itemCount: items.length,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      separatorBuilder: (context, index) =>
          SizedBox(height: properties.markerGap),
      itemBuilder: (context, index) {
        final item = items[index];
        final isFirst = reverse ? index == (items.length - 1) : index == 0;
        final isLast = reverse ? index == 0 : index == (items.length - 1);

        return LayoutBuilder(
          builder: (context, constraints) =>
              content(context, item, isFirst, isLast),
        );
      },
    );
  }
}
