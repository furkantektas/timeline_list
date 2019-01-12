import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timeline/timeline_model.dart';

const double DEFAULT_DOT_SIZE = 12.0;
const double DEFAULT_ICON_SIZE = 24.0; // default icon size
const double LINE_GAP = 6.0;

class TimelineBoxDecoration extends Decoration {
  final Color lineColor;
  final Color iconBackground;
  final double lineWidth;
  final double iconSize;
  final bool isFirst;
  final bool isLast;
  TimelineBoxDecoration(
      {this.lineColor,
      this.lineWidth,
      this.iconSize,
      this.iconBackground,
      this.isFirst,
      this.isLast});

  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _TimelinePainter(
      isFirst: isFirst,
      isLast: isLast,
      lineColor: lineColor,
      iconBackground: iconBackground,
      lineWidth: lineWidth,
      iconSize: iconSize,
    );
  }
}

class _TimelinePainter extends BoxPainter {
  final Color lineColor;
  final double lineWidth;
  final Paint linePaint;
  final Paint circlePaint;
  final double iconSize;
  final bool isFirst;
  final bool isLast;

  _TimelinePainter(
      {this.iconSize,
      this.lineColor = const Color(0xFF333333),
      this.lineWidth = 4.0,
      this.isFirst = false,
      this.isLast = false,
      iconBackground})
      : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke,
        circlePaint = Paint()
          ..color = iconBackground ?? const Color(0xFFCCCCCC)
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset offsetTop = configuration.size.topCenter(Offset(0.0, 0.0));
    final Offset topLineEnd =
        configuration.size.center(Offset(0.0, -iconSize / 2 - 2 * LINE_GAP));
    final Offset bottomLineStart =
        configuration.size.center(Offset(0.0, iconSize / 2 + 2 * LINE_GAP));
    final Offset offsetBottom =
        configuration.size.bottomCenter(Offset(0.0, 0.0));
    if (!isFirst) canvas.drawLine(offsetTop, topLineEnd, linePaint);
    if (!isLast) canvas.drawLine(bottomLineStart, offsetBottom, linePaint);

    final Offset offsetCenter = configuration.size.center(Offset(0.0, 0.0));
    canvas.drawCircle(offsetCenter, iconSize / 2 + LINE_GAP, circlePaint);
  }
}

class TimelineItem extends StatelessWidget {
  final TimelineModel model;
  final double lineWidth;
  final Color lineColor;
  final bool isFirst;
  final bool isLast;
  const TimelineItem(
      {Key key,
      this.model,
      this.lineColor,
      this.lineWidth,
      this.isFirst = false,
      this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var position;
        switch (model.position) {
          case TimelineItemPosition.left:
            position = Alignment.centerLeft;
            break;
          case TimelineItemPosition.right:
            position = Alignment.centerRight;
            break;
          case TimelineItemPosition.random:
            position = Random().nextBool()
                ? Alignment.centerLeft
                : Alignment.centerRight;
        }
        final iconSize = model.icon == null
            ? DEFAULT_DOT_SIZE // if no icon is specified, use smaller dot size
            : model.icon?.size ?? DEFAULT_ICON_SIZE;

        return Container(
            decoration: TimelineBoxDecoration(
                isFirst: isFirst,
                isLast: isLast,
                iconSize: iconSize,
                iconBackground: model.iconBackground,
                lineWidth: lineWidth,
                lineColor: lineColor),
            child: Stack(
              alignment: position,
              children: <Widget>[
                Container(
                    constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth / 2 -
                            iconSize / 2.0 -
                            LINE_GAP * 2.0,
                        minHeight: iconSize + LINE_GAP * 2),
                    child: model.child),
                Center(child: model.icon),
              ],
            ));
      },
    );
  }
}
