import 'package:mysivi_chat_app/modules/chats/domain/entities/word_mean_entity.dart';
import 'package:mysivi_chat_app/modules/chats/domain/repositories/word_mean_respository.dart';

class GetWordMeaning {
  final WordMeanRespository wordMeanRespository;

  GetWordMeaning(this.wordMeanRespository);

  Future<WordMeanEntity> call(String word) {
    return wordMeanRespository.getWordMean(word);
  }
}
