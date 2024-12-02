import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';
import 'iphone_releases.dart';
import 'onboarding.dart';

void main() => runApp(MyApp());

class SimpleTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Simple timeline")),
        body: Timeline(
          children: [
            Marker(child: Text("Step 1")),
            Marker(child: Text("Step 2")),
            Marker(child: Text("Step 3"))
          ],
        ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => ExampleDirectory(),
        '/iphone-releases': (context) => iPhoneReleaseTimelinePage(),
        '/onboarding': (context) => OnboardingPage(),
        '/simple': (context) => SimpleTimeline(),
      },
    );
  }
}

class ExampleDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline Examples")),
      body: ListView(children: [
        ListTile(
            title: Text("Timeline with icons and different alignment options"),
            onTap: () => Navigator.pushNamed(context, '/iphone-releases')),
        ListTile(
            title: Text("Onboarding example"),
            onTap: () => Navigator.pushNamed(context, '/onboarding')),
        ListTile(
            title: Text("Simple timeline"),
            onTap: () => Navigator.pushNamed(context, '/simple'))
      ]),
    );
  }
}
