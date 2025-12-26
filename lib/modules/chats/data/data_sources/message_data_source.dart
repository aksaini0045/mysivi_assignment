import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class RandomMessageDataSource {
  Future<String> fetchRandomMessage();
}

class RandomMessageNetworkSource implements RandomMessageDataSource {
  final Dio dio;

  RandomMessageNetworkSource(this.dio);

  @override
  Future<String> fetchRandomMessage() async {
    try {
      final data = await dio.get('https://api.quotable.io/random');
      if (data.statusCode == 200) {
        return data.data['content'];
      } else {
        throw Exception('Request failed');
      }
    } catch (e) {
      debugPrint('Error fetching random message');
      // we can handle specific exceptions here if needed
      rethrow;
    }
  }
}

class RandomMessageLocalSource implements RandomMessageDataSource {
  @override
  Future<String> fetchRandomMessage() async {
    return "Hi i am anuj";
  }
}
