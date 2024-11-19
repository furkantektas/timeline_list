import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';
import 'data.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int currentIndex = 1;
  static const iconSize = 36.0;
  MarkerIconAlignment iconAlignment = MarkerIconAlignment.center;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      pageBuilder(TimelinePosition.start),
      pageBuilder(TimelinePosition.center),
      pageBuilder(TimelinePosition.end)
    ];

    final navButons = [
      {'icon': Icons.format_align_left, 'label': "Left"},
      {'icon': Icons.format_align_center, 'label': "Center"},
      {'icon': Icons.format_align_right, 'label': "Right"},
    ]
        .map((marker) => BottomNavigationBarItem(
            icon: Icon(marker['icon'] as IconData),
            label: marker['label'] as String))
        .toList();

    final navBar = BottomNavigationBar(
        enableFeedback: true,
        selectedItemColor: Colors.purple,
        currentIndex: currentIndex,
        onTap: (i) => pageController.animateToPage(i,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut),
        items: navButons);

    return Scaffold(
        bottomNavigationBar: navBar,
        appBar: appBar(),
        body: PageView(
          onPageChanged: (i) => setState(() => currentIndex = i),
          controller: pageController,
          children: pages,
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Muslim Civilisation Doodles'),
      actions: [
        DropdownButton<MarkerIconAlignment>(
          value: iconAlignment,
          icon: Icon(Icons.arrow_downward),
          onChanged: (MarkerIconAlignment? newValue) {
            setState(() {
              iconAlignment = newValue!;
            });
          },
          // chose default icon alignment from
          items: MarkerIconAlignment.values
              .map<DropdownMenuItem<MarkerIconAlignment>>(
                  (MarkerIconAlignment value) {
            return DropdownMenuItem<MarkerIconAlignment>(
              value: value,
              child: Text(value.toString().split('.')[1].toUpperCase()),
            );
          }).toList(),
        ),
      ],
    );
  }

  pageBuilder(TimelinePosition position) => Timeline.builder(
        context: context,
        markerBuilder: doodleBuilder,
        markerCount: doodles.length,
        position: position,
        maxWidth: 300,
        properties: TimelineProperties(
            lineWidth: 4,
            timelinePosition: position,
            iconSize: iconSize,
            // icon alignment applies to all items in the timeline, unless
            // overridden by the item's own iconAlignment property.
            iconAlignment: iconAlignment),
      );

  Widget icon(
      TimelinePosition timelinePosition, Color iconBackground, Icon icon) {
    return Container(
      height: iconSize,
      width: iconSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: iconBackground),
      child: Icon(icon.icon, color: icon.color, size: iconSize * 2 / 3),
    );
  }

  Widget networkImage(String url) => FadeInImage.assetNetwork(
        placeholder: 'images/empty.png',
        placeholderCacheHeight: 200,
        height: 200,
        image: url,
        fit: BoxFit.contain,
      );

  Marker doodleBuilder(BuildContext context, int i, TimelinePosition position) {
    final doodle = doodles[i];
    final textTheme = Theme.of(context).textTheme;
    return Marker(
      icon: icon(position, doodle.iconBackground, doodle.icon),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ([
              networkImage(doodle.doodle),
              const SizedBox(height: 8.0),
              Text(doodle.name, style: textTheme.titleMedium),
              const SizedBox(height: 8.0),
              Text(doodle.time, style: textTheme.labelSmall),
              const SizedBox(height: 8.0),
            ]),
          ),
        ),
      ),
    );
  }
}
