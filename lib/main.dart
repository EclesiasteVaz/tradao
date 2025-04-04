import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tradao/app_providers.dart';
import 'package:tradao/app_widget.dart';
import 'package:tradao/core/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  languages.sort();
  runApp(
    const AppProviders(
      child: AppWidget(),
    ),
  );
}
