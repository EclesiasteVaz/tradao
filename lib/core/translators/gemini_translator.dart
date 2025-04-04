import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tradao/core/dtos/translate_dto.dart';
import 'package:tradao/core/models/translation.dart';
import 'package:tradao/core/translators/translator.dart';

class GeminiTranslator implements Translator {
  GeminiTranslator({required String apiKey}) {
    Gemini.init(apiKey: apiKey);
  }
  @override
  Future<Translation> translate(TranslateDto dto) async {
    final prompt = Part.text(
        'Oi tudo bem, preciso que traduzes esta frase vindo do idioma ${dto.fromLanguage} para ${dto.toLanguage}, responde sem markdown, considere retornar um json do tipo {"text": "conteudo traduzido", "language" : "A língua em que foi traduzida", "code": "o código locale, exemplo: pt-BR, etc.., baseando-se na lingua traduzida"}, sendo a frase: ${dto.text}, caso a frase não se encontra neste idioma: ${dto.fromLanguage}, retorna do jeito que esta, lembrando do modelo de json, ');
    final result = await Gemini.instance.prompt(parts: [prompt]);
    final response = result!.content!.parts!.first as TextPart;
    final dataJson = response.text.replaceAll("json", "").replaceAll("```", "");
    return compute(Translation.fromJson, (dataJson));
  }
}
