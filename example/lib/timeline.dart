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
  final data = timelineData;
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [leftTimeline, centerTimeline, rightTimeline];

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageIx,
            onTap: (i) => pageController.animateToPage(i,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.format_align_left),
                title: Text("LEFT"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_align_center),
                title: Text("CENTER"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_align_right),
                title: Text("RIGHT"),
              ),
            ]),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
          onPageChanged: (i) => setState(() => pageIx = i),
          controller: pageController,
          children: pages,
        ));
  }

  get leftTimeline => Timeline.builder(
      lineColor: Colors.deepPurpleAccent,
      lineWidth: 4.0,
      itemCount: data.length,
      position: TimelinePosition.Left,
      itemBuilder: (context, i) => data[i]);

  get centerTimeline => Timeline.builder(
      lineColor: Colors.grey[600],
      lineWidth: 4.0,
      itemCount: data.length,
      position: TimelinePosition.Center,
      itemBuilder: (context, i) => data[i].copyWith(
          position: i % 2 == 0
              ? TimelineItemPosition.left
              : TimelineItemPosition.right));

  get rightTimeline => Timeline.builder(
      lineColor: Colors.teal[600],
      lineWidth: 4.0,
      itemCount: data.length,
      position: TimelinePosition.Right,
      itemBuilder: (context, i) => data[i]);
}
