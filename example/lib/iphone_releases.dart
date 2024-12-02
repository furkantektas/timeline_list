import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';

class IPhoneRelease {
  final String modelName;
  final String releaseDate;
  final Color color;
  final IconData icon;
  const IPhoneRelease({
    required this.modelName,
    required this.releaseDate,
    required this.color,
    required this.icon,
  });
}

List<IPhoneRelease> doodles = [
  IPhoneRelease(
      modelName: "iPhone",
      releaseDate: "29 June 2007",
      color: Colors.deepPurple,
      icon: Icons.phone_iphone),
  IPhoneRelease(
      modelName: "iPhone 3G",
      releaseDate: "11 July 2008",
      color: Colors.cyan,
      icon: Icons.piano),
  IPhoneRelease(
      modelName: "iPhone 3GS",
      releaseDate: "19 June 2009",
      color: Colors.lime,
      icon: Icons.sailing),
  IPhoneRelease(
      modelName: "iPhone 4",
      releaseDate: "24 June 2010",
      color: Colors.amber,
      icon: Icons.diamond),
  IPhoneRelease(
      modelName: "iPhone 4S",
      releaseDate: "14 October 2011",
      color: Colors.deepOrange,
      icon: Icons.dashboard),
  IPhoneRelease(
      modelName: "iPhone 5",
      releaseDate: "21 September 2012",
      color: Colors.indigo,
      icon: Icons.star),
  IPhoneRelease(
      modelName: "iPhone 5S & 5C",
      releaseDate: "20 September 2013",
      color: Colors.teal,
      icon: Icons.cake),
  IPhoneRelease(
      modelName: "iPhone 6 & 6 Plus",
      releaseDate: "19 September 2014",
      color: Colors.pink,
      icon: Icons.view_comfy),
  IPhoneRelease(
      modelName: "iPhone 6S & 6S Plus",
      releaseDate: "25 September 2015",
      color: Colors.deepPurple,
      icon: Icons.fireplace),
  IPhoneRelease(
      modelName: "iPhone SE",
      releaseDate: "31 March 2016",
      color: Colors.lightGreen,
      icon: Icons.badge),
  IPhoneRelease(
      modelName: "iPhone 7 and 7 Plus",
      releaseDate: "16 September 2016",
      color: Colors.amber,
      icon: Icons.golf_course),
  IPhoneRelease(
      modelName: "iPhone 8 and 8 Plus",
      releaseDate: "22 September 2017",
      color: Colors.indigo,
      icon: Icons.alarm),
  IPhoneRelease(
      modelName: "iPhone X",
      releaseDate: "3 November 2017",
      color: Colors.cyan,
      icon: Icons.ten_k),
  IPhoneRelease(
      modelName: "iPhone XS / XS Max",
      releaseDate: "21 September 2018",
      color: Colors.deepOrange,
      icon: Icons.wb_sunny),
  IPhoneRelease(
      modelName: "iPhone XR",
      releaseDate: "26 October 2018",
      color: Colors.lime,
      icon: Icons.color_lens),
  IPhoneRelease(
      modelName: "iPhone 11",
      releaseDate: "20 September 2019",
      color: Colors.pink,
      icon: Icons.photo_camera),
  IPhoneRelease(
      modelName: "iPhone SE 2",
      releaseDate: "24 April 2020",
      color: Colors.teal,
      icon: Icons.sync),
  IPhoneRelease(
      modelName: "iPhone 12",
      releaseDate: "23 October 2020",
      color: Colors.deepPurple,
      icon: Icons.gpp_good),
  IPhoneRelease(
      modelName: "iPhone 13",
      releaseDate: "24 September 2021",
      color: Colors.amber,
      icon: Icons.battery_full),
  IPhoneRelease(
      modelName: "iPhone SE 3",
      releaseDate: "18 March 2022",
      color: Colors.lightGreen,
      icon: Icons.search),
  IPhoneRelease(
      modelName: "iPhone 14",
      releaseDate: "16 September 2022",
      color: Colors.indigo,
      icon: Icons.space_bar),
  IPhoneRelease(
      modelName: "iPhone 15",
      releaseDate: "22 September 2023",
      color: Colors.cyan,
      icon: Icons.waves),
  IPhoneRelease(
      modelName: "iPhone 16",
      releaseDate: "20 September 2024",
      color: Colors.deepOrange,
      icon: Icons.rocket)
];

class IPhoneReleaseTimelinePage extends StatefulWidget {
  @override
  State<IPhoneReleaseTimelinePage> createState() =>
      _IPhoneReleaseTimelinePageState();
}

class _IPhoneReleaseTimelinePageState extends State<IPhoneReleaseTimelinePage> {
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
      title: Text('iPhone releases'),
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
        maxWidth: 250,
        properties: TimelineProperties(
            lineWidth: 3,
            timelinePosition: position,
            lineColor: Colors.deepPurple.shade700,
            iconSize: iconSize,
            // icon alignment applies to all items in the timeline, unless
            // overridden by the item's own iconAlignment property.
            iconAlignment: iconAlignment),
      );

  Widget icon(Color iconBackground, IconData icon) {
    return Container(
        height: iconSize,
        width: iconSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(width: 3, color: iconBackground)),
        child: Center(
            child: Icon(icon, color: iconBackground, size: iconSize / 5 * 3)));
  }

  Marker doodleBuilder(BuildContext context, int i) {
    final doodle = doodles[i];
    final textTheme = Theme.of(context).textTheme;
    return Marker(
      icon: icon(doodle.color, doodle.icon),
      // Marker position is ignored when the timeline is not centered
      position: i % 2 == 0 ? MarkerPosition.left : MarkerPosition.right,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8.0),
              Container(
                height: 200,
                width: 200,
                color: doodle.color,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(doodle.icon,
                        color: Colors.white, size: 2 * iconSize),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(doodle.modelName, style: textTheme.titleMedium),
              const SizedBox(height: 4.0),
              Text(doodle.releaseDate, style: textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }
}
