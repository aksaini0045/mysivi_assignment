import 'package:mysivi_chat_app/modules/chats/data/data_sources/word_mean_data_source.dart';
import 'package:mysivi_chat_app/modules/chats/domain/entities/word_mean_entity.dart';
import 'package:mysivi_chat_app/modules/chats/domain/repositories/word_mean_respository.dart';

class WordMeanRepoImpl implements WordMeanRespository {
  final WordMeanDataSource dataSource;

  WordMeanRepoImpl(this.dataSource);

  @override
  Future<WordMeanEntity> getWordMean(String word) {
    return dataSource.getWordMean(word);
  }
}
