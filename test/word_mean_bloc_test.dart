import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mysivi_chat_app/modules/chats/domain/entities/word_mean_entity.dart';
import 'package:mysivi_chat_app/modules/chats/domain/user_cases/get_word_meaning.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc_events.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc_states.dart';

class MockGetWordMeaning extends Mock implements GetWordMeaning {}

void main() {
  test('word mean bloc should fetch word meaning successfully', () async {
    // Arrange
    final mockUseCase = MockGetWordMeaning();
    final bloc = WordMeanBloc(mockUseCase);

    when(
      () => mockUseCase.call('hello'),
    ).thenAnswer((_) async => WordMeanEntity(word: 'hello', mean: 'greeting'));

    bloc.add(LoadWordMeaningEvent('hello'));
    await Future.delayed(Duration(milliseconds: 100));

    expect(bloc.state, isA<LoadedWordMeaningState>());

    bloc.close();
  });
}
