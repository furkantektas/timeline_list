import 'package:flutter/material.dart';

enum TimelineItemPosition { left, right, random }

class TimelineModel {
  final Icon? icon;
  final Color iconBackground;
  final Widget? child;
  final TimelineItemPosition position;
  bool isFirst;
  bool isLast;
  final Function? onTap;

  TimelineModel(this.child,
      {this.icon,
        this.iconBackground = Colors.grey,
        this.position = TimelineItemPosition.random,
        this.isFirst = false,
        this.isLast = false,
        this.onTap});

  @override
  bool operator ==(o) {
    if (identical(this, o)) return true;
    if (runtimeType != o.runtimeType) return false;
    return o is TimelineModel &&
        icon == o.icon &&
        iconBackground == o.iconBackground &&
        child == o.child &&
        isFirst == o.isFirst &&
        isLast == o.isLast &&
        position == o.position;
  }

  @override
  int get hashCode =>
      hashValues(icon, iconBackground, child, position, isFirst, isLast);

  TimelineModel copyWith(
      {icon, iconBackground, child, position, isFirst, isLast}) =>
      TimelineModel(child ?? this.child,
          icon: icon ?? this.icon,
          iconBackground: iconBackground ?? this.iconBackground,
          position: position ?? this.position,
          isFirst: isFirst ?? this.isFirst,
          isLast: isLast ?? this.isLast);
}