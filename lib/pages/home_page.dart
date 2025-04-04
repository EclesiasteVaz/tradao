import 'package:flutter/material.dart';
import 'package:tradao/core/dtos/translate_dto.dart';
import 'package:tradao/core/themes/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:tradao/providers/language_selected_store.dart';
import 'package:tradao/providers/translation/translation_state.dart';
import 'package:tradao/providers/translation/translation_store.dart';
import 'package:tradao/widgets/select_language_widget.dart';
import 'package:tradao/widgets/snack_bar_widget.dart';
import 'package:tradao/widgets/text_box_result_translation_widget.dart';
import 'package:tradao/widgets/text_box_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textForTranslationController = TextEditingController();
  final _translationController = TextEditingController();

  TranslationStore get translationStore => context.read<TranslationStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tradao",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: context.read<MyTheme>().change,
            icon: const Icon(Icons.brightness_4),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width > 500 ? 480 : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextBoxWidget(
                    editingController: _textForTranslationController,
                    onFieldSubmitted: (e) => _translate(),
                    hintText: "Escreva a frase que prentedes traduzir",
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectLanguageWidget(),
                  ),
                  TextBoxResultTranslationWidget(
                    textEditingController: _translationController,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .87,
                    child: ListenableBuilder(
                        listenable: translationStore,
                        builder: (context, child) {
                          return ElevatedButton(
                            onPressed: _translate,
                            child: translationStore.state
                                    is TranslationStateLoading
                                ? const SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text("Traduzir"),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _translate() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    await translationStore.translate(
      TranslateDto(
          text: _textForTranslationController.text,
          fromLanguage: context.read<LanguageSelectedStore>().fromLanguage,
          toLanguage: context.read<LanguageSelectedStore>().toLanguage),
    );
    final state = translationStore.state;
    if (state is TranslationStateSuccess) {
      _translationController.text = state.translation.text;
    }

    if (state is TranslationStateError) {
      scaffoldMessenger.showSnackBar(SnackBarWidget(text: state.error));
    }
  }
}
