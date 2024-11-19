import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var checkIcon = Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        child: Icon(Icons.check, color: Colors.white, size: 12));
    var emptyIcon = Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey));
    return Scaffold(
        appBar: AppBar(title: const Text("Onboarding example")),
        body: Column(children: [
          Timeline.builder(
            context: context,
            markerCount: 10,
            properties: TimelineProperties(
                iconAlignment: MarkerIconAlignment.center,
                iconSize: 16,
                timelinePosition: TimelinePosition.start),
            markerBuilder: (context, index, position) => Marker(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Step ${index + 1}"),
              ),
              icon: index >= 8 ? emptyIcon : checkIcon,
              position: MarkerPosition.left,
            ),
            position: TimelinePosition.center,
          ),
        ]));
  }
}
