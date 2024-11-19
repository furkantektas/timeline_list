import 'package:flutter/material.dart';
import 'timeline.dart';
import 'onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => ExampleDirectory(),
        '/timeline': (context) => TimelinePage(),
        '/onboarding': (context) => OnboardingPage(),
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
            onTap: () => Navigator.pushNamed(context, '/timeline')),
        ListTile(
            title: Text("Onboarding example"),
            onTap: () => Navigator.pushNamed(context, '/onboarding')),
      ]),
    );
  }
}
