import 'dart:convert';

class Translation {
  final String text;
  final String language;
  final String code;

  Translation({
    required this.text,
    required this.language,
    required this.code,
  });

  Translation copyWith({
    String? text,
    String? language,
    String? code,
  }) {
    return Translation(
      text: text ?? this.text,
      language: language ?? this.language,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'language': language,
      'code': code,
    };
  }

  factory Translation.fromMap(Map<String, dynamic> map) {
    return Translation(
      text: map['text'] as String,
      language: map['language'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Translation.fromJson(String source) =>
      Translation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Translation(text: $text, language: $language, code: $code)';

  @override
  bool operator ==(covariant Translation other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.language == language &&
        other.code == code;
  }

  @override
  int get hashCode => text.hashCode ^ language.hashCode ^ code.hashCode;
}
