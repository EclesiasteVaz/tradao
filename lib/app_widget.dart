import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradao/core/themes/my_theme.dart';
import 'package:tradao/pages/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  MyTheme get myTheme => context.read<MyTheme>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: myTheme,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tradao',
          theme: myTheme.getTheme,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
