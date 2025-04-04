import 'package:flutter/material.dart';
import 'package:tradao/core/dtos/translate_dto.dart';
import 'package:tradao/core/translators/translator.dart';
import 'package:tradao/providers/translation/translation_state.dart';

class TranslationStore extends ChangeNotifier {
  final Translator _translator;

  TranslationStore(this._translator);

  TranslationState _state = TranslationStateInitial();

  TranslationState get state => _state;

  Future<void> translate(TranslateDto dto) async {
    _changeState(TranslationStateLoading());
    try {
      final result = await _translator.translate(dto);
      _changeState(TranslationStateSuccess(result));
    } catch (e) {
      debugPrint(e.toString());
      _changeState(
        TranslationStateError("Ocorreu um erro, durante a tradução"),
      );
    }
  }

  void _changeState(TranslationState state) {
    _state = state;
    notifyListeners();
  }
}
