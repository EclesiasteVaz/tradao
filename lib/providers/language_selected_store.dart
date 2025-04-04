import 'package:flutter/material.dart';

class LanguageSelectedStore extends ChangeNotifier {
  String _fromLanguage = 'Português';
  String _toLanguage = 'Inglẽs';

  String get fromLanguage => _fromLanguage;
  String get toLanguage => _toLanguage;

  changeFromLanguage(String language) {
    _fromLanguage = language;
    notifyListeners();
  }

  changeToLanguage(String language) {
    _toLanguage = language;
    notifyListeners();
  }

  alternLanguages() {
    final oldFromLanguage = _fromLanguage;
    final oldToLanguage = _toLanguage;

    _fromLanguage = oldToLanguage;
    _toLanguage = oldFromLanguage;
    notifyListeners();
  }
}
