import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';

abstract class ChatHistoryListRepository {
  Future<List<ChatHistoryEntity>> getChatHistory();
}
