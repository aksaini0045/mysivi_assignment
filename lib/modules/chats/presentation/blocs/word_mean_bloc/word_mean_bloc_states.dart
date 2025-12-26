import 'package:mysivi_chat_app/modules/chats/domain/entities/word_mean_entity.dart';

sealed class WordMeanBlocStates {}

class LoadingWordMeaningState extends WordMeanBlocStates {}

class LoadedWordMeaningState extends WordMeanBlocStates {
  final WordMeanEntity wordMeanEntity;
  LoadedWordMeaningState(this.wordMeanEntity);
}

class ErrorLoadingWordMeanState extends WordMeanBlocStates {
  final String? error;
  ErrorLoadingWordMeanState({this.error});
}
