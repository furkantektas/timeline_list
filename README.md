# Flutter Timeline Widget
[![pub package](https://img.shields.io/pub/v/timeline_list.svg)](https://pub.dartlang.org/packages/timeline_list)
[![Build Status](https://travis-ci.org/furkantektas/timeline_list.svg?branch=master)](https://travis-ci.org/furkantektas/timeline_list)  [![codecov](https://codecov.io/gh/furkantektas/timeline_list/branch/master/graph/badge.svg?token=jDCYhfSuea)](https://codecov.io/gh/furkantektas/timeline_list)

Displays a scrollable timeline with custom child widgets and custom icons.

![Flutter Timeline List Screenshot](https://github.com/furkantektas/timeline_list/raw/master/doc/timeline_list.png?raw=true)


## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  timeline_list: ^0.0.3
```

## Features

- 3 different timeline alignments. `Left, Center, Right`.
- On demand child building with `Timeline.builder`.
- Custom icon and icon size support (icon sizes supported only on centered timeline).

## Usage

```dart
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

List<TimelineModel> items = [
      TimelineModel(Placeholder(),
          position: TimelineItemPosition.random,
          iconBackground: Colors.redAccent,
          icon: Icon(Icons.blur_circular)),
      TimelineModel(Placeholder(),
          position: TimelineItemPosition.random,
          iconBackground: Colors.redAccent,
          icon: Icon(Icons.blur_circular)),
    ];
    return Timeline(children: items, position: TimelinePosition.Center);
```

## Example

A sample timeline app can be found in the [`example/`](https://github.com/furkantektas/timeline_list/tree/master/example) folder.


![ehlibyte games](http://ehlibyte.com/images/ehlibyte-logo-small.png?raw=true)
