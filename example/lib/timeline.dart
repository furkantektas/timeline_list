import 'package:flutter/material.dart';
import 'package:timeline/timeline.dart';
import 'package:timeline/timeline_model.dart';
import 'data.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    final data = timelineData;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Timeline.builder(
          lineColor: Colors.grey[600],
          lineWidth: 4.0,
          itemCount: data.length,
          itemBuilder: (context, i) => data[i]
//              .copyWith(
//              position: i % 2 == 0
//                  ? TimelineItemPosition.left
//                  : TimelineItemPosition.right)
          ),
    );
  }
}
