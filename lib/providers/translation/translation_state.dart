import 'package:tradao/core/models/translation.dart';

sealed class TranslationState {}

final class TranslationStateInitial extends TranslationState {}

final class TranslationStateLoading extends TranslationState {}

final class TranslationStateSuccess extends TranslationState {
  final Translation translation;
  TranslationStateSuccess(this.translation);
}

final class TranslationStateError extends TranslationState {
  final String error;

  TranslationStateError(this.error);
}
