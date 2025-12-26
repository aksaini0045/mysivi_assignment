import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/chats/domain/user_cases/get_word_meaning.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc_events.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc_states.dart';

class WordMeanBloc extends Bloc<WordMeanBlocEvents, WordMeanBlocStates> {
  final GetWordMeaning _getWordMeaning;
  WordMeanBloc(this._getWordMeaning) : super(LoadingWordMeaningState()) {
    on<LoadWordMeaningEvent>(_loadWordMeaning);
  }

  void _loadWordMeaning(
    LoadWordMeaningEvent event,
    Emitter<WordMeanBlocStates> emit,
  ) async {
    emit(LoadingWordMeaningState());

    try {
      final data = await _getWordMeaning.call(event.word);
      if (data.mean != null) {
        emit(LoadedWordMeaningState(data));
      } else {
        emit(ErrorLoadingWordMeanState(error: "Unable to find word meaning"));
      }
    } catch (e) {
      emit(ErrorLoadingWordMeanState(error: e.toString()));
    }
  }
}
