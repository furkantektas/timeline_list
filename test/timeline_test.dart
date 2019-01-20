import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

void main() {
  testWidgets('TimelineModel equality and hashCode',
      (WidgetTester tester) async {
    final child = Container();
    final icon = Icon(Icons.add);
    final icon2 = Icon(Icons.remove);
    final TimelineModel model1 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon,
        iconBackground: Colors.yellow);
    final TimelineModel model2 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon,
        iconBackground: Colors.yellow);
    final TimelineModel model3 = TimelineModel(child,
        position: TimelineItemPosition.left,
        icon: icon,
        iconBackground: Colors.yellow);
    final TimelineModel model4 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon,
        iconBackground: Colors.blue);
    final TimelineModel model5 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon2,
        iconBackground: Colors.yellow);

    expect(model1 == model2, true);
    expect(model1.hashCode == model2.hashCode, true);
    expect(model1 == model3, false);
    expect(model1.hashCode == model3.hashCode, false);
    expect(model1 == model4, false);
    expect(model1 == model5, false);

    final TimelineModel model6 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon2,
        iconBackground: Colors.blue,
        isFirst: true,
        isLast: true);

    final TimelineModel model7 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon2,
        iconBackground: Colors.blue,
        isFirst: false,
        isLast: true);

    final TimelineModel model8 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon2,
        iconBackground: Colors.blue,
        isFirst: true,
        isLast: false);

    final TimelineModel model9 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon2,
        iconBackground: Colors.blue,
        isFirst: false,
        isLast: false);

    final TimelineModel model10 = TimelineModel(child,
        position: TimelineItemPosition.random,
        icon: icon2,
        iconBackground: Colors.blue,
        isFirst: true,
        isLast: true);

    expect(model6 == model7, false);
    expect(model6 == model8, false);
    expect(model6 == model9, false);
    expect(model6 == model10, true);

    final model3Copy = model3.copyWith(position: TimelineItemPosition.random);
    final model1Copy = model1.copyWith(icon: icon2);
    final model5Copy = model5.copyWith(icon: icon);
    expect(model1 == model3Copy, true);
    expect(model1 == model1Copy, false);
    expect(model1 == model5Copy, true);

    final model6Copy1 = model6.copyWith(isFirst: false);
    final model6Copy2 = model6.copyWith(isLast: false);
    expect(model6 == model6Copy1, false);
    expect(model6 == model6Copy2, false);
  });

  testWidgets('Empty timeline', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(children: <TimelineModel>[])));

    expect(find.byType(Timeline), findsOneWidget);
  });

  testWidgets('Empty timeline builder', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Timeline.builder(itemBuilder: (context, i) => null, itemCount: 0),
    ));

    expect(find.byType(Timeline), findsOneWidget);
  });

  final key = UniqueKey();
  testWidgets('Single item size', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(children: <TimelineModel>[
          TimelineModel(Container(key: key, width: 200.0, height: 200.0))
        ])));

    final captor = find.byKey(key);
    expect(captor, findsOneWidget);

    final box = tester.renderObject<RenderBox>(captor);
    expect(box.size.height, 200.0);
    expect(box.size.width, 200.0);
  });

  testWidgets('Multiple items', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          children: <TimelineModel>[
            TimelineModel(Text("1")),
            TimelineModel(Text("2"))
          ],
        )));

    expect(find.text("1"), findsOneWidget);
    expect(find.text("2"), findsOneWidget);
    expect(find.text("3"), findsNothing);
  });

  testWidgets('Custom Icon', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          children: <TimelineModel>[
            TimelineModel(Container(),
                icon: Icon(
                  Icons.add,
                  color: Colors.yellow,
                ))
          ],
        )));

    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Reverse List', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline.builder(
            reverse: true,
            itemCount: 1,
            itemBuilder: (context, i) => TimelineModel(Container(),
                icon: Icon(
                  Icons.add,
                  color: i == 0 ? Colors.blue : Colors.green,
                )))));

    final finder = find.byIcon(Icons.add);
    expect(finder, findsOneWidget);
    expect(tester.widget<Icon>(finder).color, Colors.blue);
  });

  testWidgets('No icon timeline', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          children: <TimelineModel>[TimelineModel(Container())],
        )));

    expect(find.widgetWithIcon(Object, Icons.add), findsNothing);
  });

  testWidgets('Center timeline item alignment', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          position: TimelinePosition.Center,
          children: <TimelineModel>[
            TimelineModel(Container(),
                icon: Icon(Icons.add), position: TimelineItemPosition.left)
          ],
        )));

    final RenderStack actualPositionedBoxLeft =
        tester.renderObject(find.byType(Stack).first);

    Alignment actualAlignmentLeft = actualPositionedBoxLeft.alignment;
    expect(actualAlignmentLeft, Alignment.centerLeft);

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          position: TimelinePosition.Center,
          children: <TimelineModel>[
            TimelineModel(Container(),
                icon: Icon(Icons.add), position: TimelineItemPosition.right)
          ],
        )));

    final RenderStack actualPositionedBoxRight =
        tester.renderObject(find.byType(Stack).first);

    Alignment actualAlignmentRight = actualPositionedBoxRight.alignment;
    expect(actualAlignmentRight, Alignment.centerRight);
  });

  testWidgets('Icon size', (WidgetTester tester) async {
    const DEFAULT_ICON_SIZE = 24.0;
    const ICON_SIZE = DEFAULT_ICON_SIZE + 1.0;
    final children = <TimelineModel>[
      TimelineModel(Container(),
          icon: Icon(
            Icons.add,
            size: ICON_SIZE,
          ))
    ];

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(position: TimelinePosition.Left, children: children)));

    RenderBox box = tester.renderObject(find.byIcon(Icons.add));
    expect(box.size.width, DEFAULT_ICON_SIZE);

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(position: TimelinePosition.Right, children: children)));

    box = tester.renderObject(find.byIcon(Icons.add));

    expect(box.size.width, DEFAULT_ICON_SIZE);
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child:
            Timeline(position: TimelinePosition.Center, children: children)));

    box = tester.renderObject(find.byIcon(Icons.add));
    expect(box.size.width, ICON_SIZE);
  });

  testWidgets('Left/Right timeline item alignment',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          position: TimelinePosition.Left,
          children: <TimelineModel>[
            TimelineModel(Container(), position: TimelineItemPosition.right)
          ],
        )));

    var finderLeft = find.byType(Row);
    expect(finderLeft, findsOneWidget);
    final Row row = finderLeft.evaluate().first.widget;

    expect(row.mainAxisAlignment, MainAxisAlignment.start);

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          position: TimelinePosition.Right,
          children: <TimelineModel>[
            TimelineModel(Container(), position: TimelineItemPosition.left)
          ],
        )));

    final finderRight = find.byType(Row);
    expect(finderRight, findsOneWidget);
    final Row rowEnd = finderRight.evaluate().first.widget;

    expect(rowEnd.mainAxisAlignment, MainAxisAlignment.end);
  });

  testWidgets('Center timeline item alignment and icon size',
      (WidgetTester tester) async {
    const ICON_SIZE = 120.0;

    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline(
          position: TimelinePosition.Center,
          children: <TimelineModel>[
            TimelineModel(Container(),
                icon: Icon(
                  Icons.add,
                  size: ICON_SIZE,
                ),
                position: TimelineItemPosition.left)
          ],
        )));

    final RenderStack actualPositionedBoxLeft =
        tester.renderObject(find.byType(Stack));

    Alignment actualAlignmentLeft = actualPositionedBoxLeft.alignment;
    expect(actualAlignmentLeft, Alignment.centerLeft);

    final Icon icon = find.byIcon(Icons.add).evaluate().first.widget;
    expect(icon.size, ICON_SIZE);
  });

  testWidgets('Multiple items viewport offset', (WidgetTester tester) async {
    const ITEM_COUNT = 200;
    const ITEM_HEIGHT = 200.0;
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Timeline.builder(
          itemCount: ITEM_COUNT,
          itemBuilder: ((context, i) => TimelineModel(Placeholder(
                fallbackHeight: ITEM_HEIGHT,
              ))),
        )));

    await tester.fling(
        find.byType(Timeline),
        const Offset(0.0, -1 * ITEM_COUNT * ITEM_HEIGHT),
        ITEM_COUNT * ITEM_HEIGHT);
    await tester.pumpAndSettle(const Duration(milliseconds: 10));
    final Viewport viewport = tester.widget(find.byType(Viewport));
    expect(viewport.offset.pixels, equals((ITEM_COUNT - 3) * ITEM_HEIGHT));
  });
}
