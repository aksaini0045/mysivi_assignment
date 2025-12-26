import 'package:mysivi_chat_app/modules/chats/domain/entities/word_mean_entity.dart';

abstract class WordMeanRespository {
  Future<WordMeanEntity> getWordMean(String word);
}
