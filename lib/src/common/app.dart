import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/src/common/presentation/theme/app_theme.dart'
    as theme;
import 'package:flutter_custom_painter/src/features/example/presentation/example_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (_) => 'Custom Painter',
      theme: theme.appThemeData,
      home: const ExamplePage(),
    );
  }
}
