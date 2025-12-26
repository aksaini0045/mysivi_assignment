import 'package:mysivi_chat_app/modules/chats/data/data_sources/message_data_source.dart';
import 'package:mysivi_chat_app/modules/chats/domain/repositories/chat_repository.dart';

class ChatRespostoryImpl implements ChatRepository {
  final RandomMessageDataSource dataSource;

  ChatRespostoryImpl(this.dataSource);

  @override
  Future<String> getRandomReceivedMessage() async {
    return dataSource.fetchRandomMessage();
  }
}
