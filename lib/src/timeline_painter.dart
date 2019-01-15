import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';

class TimelineBoxDecoration extends Decoration {
  final Color iconBackground;
  final TimelineProperties properties;
  final double iconSize;
  final bool isFirst;
  final bool isLast;
  final TimelinePosition timelinePosition;

  static const double DEFAULT_DOT_SIZE = 12.0;
  static const double DEFAULT_ICON_SIZE = 24.0; // default icon size
  static const double LINE_GAP = 6.0;

  TimelineBoxDecoration(
      {this.properties,
      this.iconSize,
      this.iconBackground,
      this.isFirst,
      this.isLast,
      this.timelinePosition});

  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    switch (timelinePosition) {
      case TimelinePosition.Left:
        return _TimelinePainterLeft(
            isFirst: isFirst,
            isLast: isLast,
            iconBackground: iconBackground,
            properties: properties,
            iconSize: iconSize);
      case TimelinePosition.Right:
        return _TimelinePainterRight(
            isFirst: isFirst,
            isLast: isLast,
            iconBackground: iconBackground,
            properties: properties,
            iconSize: iconSize);
      case TimelinePosition.Center:
      default:
        return _TimelinePainterCenter(
            isFirst: isFirst,
            isLast: isLast,
            properties: properties,
            iconBackground: iconBackground,
            iconSize: iconSize);
    }
  }
}

abstract class _TimelinePainter extends BoxPainter {
  final Paint linePaint;
  final Paint circlePaint;
  final double iconSize;
  final bool isFirst;
  final bool isLast;
  final TimelinePosition timelinePosition;
  final TimelineProperties properties;

  _TimelinePainter(
      {this.iconSize,
      this.properties,
      this.isFirst = false,
      this.isLast = false,
      this.timelinePosition,
      iconBackground})
      : linePaint = Paint()
          ..color = properties.lineColor
          ..strokeCap = StrokeCap.round
          ..strokeWidth = properties.lineWidth
          ..style = PaintingStyle.stroke,
        circlePaint = Paint()
          ..color = iconBackground ?? const Color(0xFFCCCCCC)
          ..style = PaintingStyle.fill;
}

class _TimelinePainterCenter extends _TimelinePainter {
  _TimelinePainterCenter(
      {iconSize, properties, isFirst, isLast, iconBackground})
      : super(
            iconSize: iconSize,
            properties: properties,
            isFirst: isFirst,
            isLast: isLast,
            iconBackground: iconBackground);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset offsetTop = configuration.size.topCenter(Offset(0.0, 0.0));
    final Offset topLineEnd = configuration.size.center(Offset(
        0.0, offset.dy - iconSize / 2 - 2 * TimelineBoxDecoration.LINE_GAP));
    final Offset bottomLineStart = configuration.size.center(Offset(
        0.0, offset.dy + iconSize / 2 + 2 * TimelineBoxDecoration.LINE_GAP));
    final Offset offsetBottom =
        configuration.size.bottomCenter(Offset(0.0, offset.dy * 2));
    if (!isFirst) canvas.drawLine(offsetTop, topLineEnd, linePaint);
    if (!isLast) canvas.drawLine(bottomLineStart, offsetBottom, linePaint);

    final Offset offsetCenter =
        configuration.size.center(Offset(0.0, offset.dy));
    canvas.drawCircle(offsetCenter,
        iconSize / 2 + TimelineBoxDecoration.LINE_GAP, circlePaint);
  }
}

class _TimelinePainterLeft extends _TimelinePainter {
  _TimelinePainterLeft({iconSize, properties, isFirst, isLast, iconBackground})
      : super(
            iconSize: iconSize,
            properties: properties,
            isFirst: isFirst,
            isLast: isLast,
            iconBackground: iconBackground);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double iconBackgroundRadius =
        iconSize / 2 + TimelineBoxDecoration.LINE_GAP;

    double iconMargin;
    if (iconSize == TimelineBoxDecoration.DEFAULT_DOT_SIZE)
      iconMargin = TimelineBoxDecoration.DEFAULT_ICON_SIZE / 2 +
          2 * TimelineBoxDecoration.LINE_GAP;
    else
      iconMargin = iconBackgroundRadius + TimelineBoxDecoration.LINE_GAP;

    final leftOffset = Offset(iconMargin, offset.dy);
    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconMargin));
    final Offset centerBottom = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconMargin));
    final Offset end =
        configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));
    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, end, linePaint);

    final Offset offsetCenter = configuration.size.centerLeft(leftOffset);
    canvas.drawCircle(offsetCenter, iconBackgroundRadius, circlePaint);
  }
}

class _TimelinePainterRight extends _TimelinePainter {
  _TimelinePainterRight({iconSize, properties, isFirst, isLast, iconBackground})
      : super(
            iconSize: iconSize,
            properties: properties,
            isFirst: isFirst,
            isLast: isLast,
            iconBackground: iconBackground);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double iconBackgroundRadius =
        iconSize / 2 + TimelineBoxDecoration.LINE_GAP;

    double iconMargin;
    if (iconSize == TimelineBoxDecoration.DEFAULT_DOT_SIZE)
      iconMargin = TimelineBoxDecoration.DEFAULT_ICON_SIZE / 2 +
          2 * TimelineBoxDecoration.LINE_GAP;
    else
      iconMargin = iconBackgroundRadius + TimelineBoxDecoration.LINE_GAP;

    final rightOffset = Offset(offset.dx - iconMargin, offset.dy);
    final Offset top = configuration.size.topRight(Offset(rightOffset.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerRight(Offset(rightOffset.dx, rightOffset.dy - iconMargin));
    final Offset centerBottom = configuration.size
        .centerRight(Offset(rightOffset.dx, rightOffset.dy + iconMargin));
    final Offset end = configuration.size
        .bottomRight(Offset(rightOffset.dx, rightOffset.dy * 2));
    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, end, linePaint);

    final Offset offsetCenter = configuration.size.centerRight(rightOffset);
    canvas.drawCircle(offsetCenter, iconBackgroundRadius, circlePaint);
  }
}
