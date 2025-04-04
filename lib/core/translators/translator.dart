import 'package:tradao/core/dtos/translate_dto.dart';
import 'package:tradao/core/models/translation.dart';

abstract interface class Translator {
  Future<Translation> translate(TranslateDto dto);
}
