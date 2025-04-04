import 'package:flutter/material.dart';
import 'package:tradao/providers/language_selected_store.dart';
import 'package:tradao/widgets/dialogs/dialog_select_language.dart';
import 'package:provider/provider.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({super.key});

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    final languageSelectedStore = context.read<LanguageSelectedStore>();
    return ListenableBuilder(
        listenable: languageSelectedStore,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(DialogRoute(
                  context: context,
                  builder: (context) => DialogSelectLanguage(
                    currentLanguage: languageSelectedStore.fromLanguage,
                    changeCurrentLanguage:
                        languageSelectedStore.changeFromLanguage,
                  ),
                )),
                child: SizedBox(
                    width: 100,
                    child: Text(languageSelectedStore.fromLanguage)),
              ),
              SizedBox(
                width: 100,
                child: IconButton(
                    onPressed: languageSelectedStore.alternLanguages,
                    icon: const Icon(Icons.change_circle_outlined)),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  DialogRoute(
                    context: context,
                    builder: (context) => DialogSelectLanguage(
                      currentLanguage: languageSelectedStore.toLanguage,
                      changeCurrentLanguage:
                          languageSelectedStore.changeToLanguage,
                    ),
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    languageSelectedStore.toLanguage,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              )
            ],
          );
        });
  }
}
