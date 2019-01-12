import 'package:flutter/material.dart';

enum TimelineItemPosition { left, right, random }

class TimelineModel {
  final Icon icon;
  final Color iconBackground;
  final Widget child;
  final bool centerChild;
  final TimelineItemPosition position;

  const TimelineModel(this.child,
      {this.icon,
      this.iconBackground,
      this.centerChild = false,
      this.position = TimelineItemPosition.random});

  @override
  bool operator ==(o) {
    if (identical(this, o)) return true;
    if (runtimeType != o.runtimeType) return false;
    final TimelineModel typedOther = o;
    return icon == typedOther.icon &&
        iconBackground == typedOther.iconBackground &&
        child == typedOther.child &&
        centerChild == typedOther.centerChild &&
        position == typedOther.position;
  }

  @override
  int get hashCode =>
      hashValues(icon, iconBackground, child, centerChild, position);

  TimelineModel copyWith(
          {icon, iconBackground, child, centerChild, position}) =>
      TimelineModel(child ?? this.child,
          icon: icon ?? this.icon,
          iconBackground: iconBackground ?? this.iconBackground,
          centerChild: centerChild ?? this.centerChild,
          position: position ?? this.position);
}
