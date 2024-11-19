library timeline;

import 'package:flutter/material.dart';

import 'src/timeline_widget.dart';
export 'src/types/timeline_properties.dart';
import 'src/types/types.dart';
export 'src/timeline_decoration.dart';
export 'src/timeline_widget.dart';
export 'src/marker_widget.dart';
export 'src/types/types.dart';

class Timeline extends StatelessWidget {
  final List<Marker> children;
  final TimelinePosition position;
  final TimelineProperties properties;

  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final double maxWidth;
  final double horizontalPadding;

  const Timeline({
    Key? key,
    required this.children,
    this.position = TimelinePosition.center,
    this.properties = const TimelineProperties(),
    this.controller,
    this.physics,
    this.shrinkWrap = true,
    this.reverse = false,
    this.maxWidth = double.infinity,
    this.horizontalPadding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineWidget(
      items: children,
      position: position,
      properties: properties,
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap,
      reverse: reverse,
      maxWidth: maxWidth,
      horizontalPadding: horizontalPadding,
    );
  }

  static Timeline builder({
    required BuildContext context,
    required int markerCount,
    required MarkerBuilder markerBuilder,
    TimelinePosition position = TimelinePosition.center,
    TimelineProperties properties = const TimelineProperties(),
    ScrollController? controller,
    ScrollPhysics? physics,
    bool shrinkWrap = true,
    bool reverse = false,
    double maxWidth = double.infinity,
    double horizontalPadding = 16,
  }) {
    return Timeline(
      children: List.generate(
        markerCount,
        (index) => markerBuilder(context, index, position),
      ),
      position: position,
      properties: properties,
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap,
      reverse: reverse,
      maxWidth: maxWidth,
      horizontalPadding: horizontalPadding,
    );
  }
}
