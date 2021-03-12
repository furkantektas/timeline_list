import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'timeline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Timeline Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Timeline(
          children: <TimelineModel>[
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("data"),
                ),
              ),
              icon: Icon(Icons.receipt, color: Colors.white),
              iconBackground: Colors.blue,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("data"),
                ),
              ),
              icon: Icon(Icons.android),
              iconBackground: Colors.cyan,
            ),
          ],
          position: TimelinePosition.Left,
          iconSize: 40,
          lineColor: Colors.blue,
        ) //TimelinePage(title: 'Muslim Civilisation Doodles'),
        );
  }
}
