import 'package:flutter/material.dart';
import '../timeline_list.dart';

class MarkerWidget extends StatelessWidget {
  /// The marker data containing content and configuration.
  final Marker data;

  /// Whether this marker is the first one in the timeline.
  final bool isFirst;

  /// Whether this marker is the last one in the timeline.
  final bool isLast;

  /// Timeline-specific properties that affect the marker's appearance.
  final TimelineProperties properties;

  /// Creates a new [MarkerWidget].
  ///
  /// Requires [data] containing the marker's content and configuration,
  /// position indicators [isFirst] and [isLast], and timeline [properties].
  MarkerWidget(
      {Key? key,
      required this.data,
      required this.isFirst,
      required this.isLast,
      required this.properties})
      : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: TimelineDecoration(
              isFirst: isFirst,
              isLast: isLast,
              properties: properties,
              iconAlignment: data.iconAlignment!,
              iconSize: properties.iconSize,
            ),
            child: content(context, constraints),
          );
        },
      );

  /// Builds the content layout of the marker.
  ///
  /// This method handles the positioning of the marker's content and icon based on
  /// the timeline's position (center or sides) and the marker's position settings.
  /// It ensures proper spacing and alignment of all elements.
  Widget content(BuildContext context, BoxConstraints constraints) {
    List<Widget> children = [];
    if (properties.timelinePosition == TimelinePosition.center) {
      final maxWidth = constraints.maxWidth / 2 -
          properties.iconSize / 2 -
          properties.iconGap;
      final balanceWidget = SizedBox(width: maxWidth);
      children = [
        SizedBox(width: maxWidth, child: childWidget(constraints)),
        SizedBox(width: properties.iconGap),
        iconWidget(),
        SizedBox(width: properties.iconGap),
        balanceWidget,
      ];
    } else {
      children = [
        childWidget(constraints),
        SizedBox(width: properties.iconGap),
        iconWidget()
      ];
    }

    return Row(
      // align icon w.r.t. timeline item position in the row
      crossAxisAlignment: data.iconAlignment!.asCrossAxisAlignment(),
      mainAxisAlignment: properties.timelinePosition.asMainAxisAlignment(),
      children: data.position.isLeft() ? children.reversed.toList() : children,
    );
  }

  /// Builds the marker's main content widget with appropriate constraints.
  ///
  /// Handles special layout cases for centered timelines and ensures proper
  /// alignment and sizing of the content.
  Widget childWidget(BoxConstraints constraints) {
    final child = ConstrainedBox(
      constraints: BoxConstraints(
          minHeight:
              properties.iconSize + properties.markerGap + properties.lineWidth,
          maxWidth: (
              // if timeline is centered, clamp the width to half of
              // the screen size excluding the icon size and margin
              properties.timelinePosition == TimelinePosition.center
                  ? (constraints.maxWidth / 2 -
                      properties.iconSize -
                      properties.iconGap)
                  : constraints.maxWidth)),
      child: data.child,
    );
    if (properties.timelinePosition == TimelinePosition.center) {
      // align child opposite to it's position to make it look aligned around
      // the center line
      return Align(
        alignment: data.position.isLeft()
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: child,
      );
    }

    return child;
  }

  /// Builds the marker's icon widget.
  ///
  /// If no custom icon is provided in the marker data, creates a default
  /// circular dot using the timeline's line color.
  Widget iconWidget() => SizedBox(
      width: properties.iconSize,
      height: properties.iconSize,
      child: data.icon ??
          Container(
              width: properties.lineWidth * 2,
              height: properties.lineWidth * 2,
              decoration: BoxDecoration(
                  color: properties.lineColor, shape: BoxShape.circle)));
}
