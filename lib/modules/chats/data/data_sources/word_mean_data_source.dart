import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:mysivi_chat_app/modules/chats/data/models/word_mean_data_model.dart';
import 'package:mysivi_chat_app/modules/chats/domain/entities/word_mean_entity.dart';

abstract class WordMeanDataSource {
  Future<WordMeanEntity> getWordMean(String word);
}

class WordMeanNetworkSorce implements WordMeanDataSource {
  final Dio dio;

  WordMeanNetworkSorce(this.dio);

  @override
  Future<WordMeanEntity> getWordMean(String word) async {
    try {
      final data = await dio.get(
        'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
      );
      if (data.statusCode == 200) {
        if (data.data is List && data.data.isNotEmpty) {
          final dataModel = WordMeanDataModel.fromJson(data.data.first);

          if ((dataModel.meanings ?? []).isNotEmpty &&
              (dataModel.meanings?.first.definitions ?? []).isNotEmpty) {
            return WordMeanEntity(
              word: word,
              mean:
                  (dataModel.meanings?.first.definitions ?? [])[0].definition ??
                  '',
            );
          }
        }
      }
      // else case
      throw Exception('Request failed');
    } catch (e) {
      debugPrint('Error fetching meaning');
      // we can handle specific exceptions here if needed
      rethrow;
    }
  }
}
