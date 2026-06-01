import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_flutter_pages_demo/main.dart';

void main() {
  testWidgets('group Flutter Pages demo renders main sections', (tester) async {
    await tester.pumpWidget(const GroupFlutterPagesApp());

    expect(find.text('小组项目展示'), findsOneWidget);
    expect(find.text('第 1 组校园活动展示平台'), findsOneWidget);
    expect(find.text('小组成员与分工'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('项目功能'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('发布说明'), findsOneWidget);
  });
}
