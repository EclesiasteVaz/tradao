import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradao/core/themes/my_theme.dart';
import 'package:tradao/core/translators/gemini_translator.dart';
import 'package:tradao/core/translators/translator.dart';
import 'package:tradao/providers/language_selected_store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tradao/providers/translation/translation_store.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyTheme(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageSelectedStore(),
        ),
        Provider<Translator>(
          create: (context) => GeminiTranslator(
            apiKey: dotenv.get("TRANSLATOR_API_KEY"),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TranslationStore(context.read()),
        )
      ],
      child: child,
    );
  }
}
