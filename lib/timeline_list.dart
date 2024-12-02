library;

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
  final TimelineProperties properties;

  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final double maxWidth;
  final double horizontalPadding;

  const Timeline({
    super.key,
    required this.children,
    this.properties = const TimelineProperties(),
    this.controller,
    this.physics,
    this.shrinkWrap = true,
    this.reverse = false,
    this.maxWidth = double.infinity,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineWidget(
      items: children,
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
        (index) => markerBuilder(context, index),
      ),
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
