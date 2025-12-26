import 'package:mysivi_chat_app/modules/home/data/data_sources/chat_history_data_source.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';
import 'package:mysivi_chat_app/modules/home/domain/repositories/chat_history_list_repository.dart';

class ChatHistoryListRepoImpl implements ChatHistoryListRepository {
  final ChatHistoryDataSource chatHistoryDataSource;
  ChatHistoryListRepoImpl(this.chatHistoryDataSource);
  @override
  Future<List<ChatHistoryEntity>> getChatHistory() async {
    return chatHistoryDataSource.loadChatHistory();
  }
}
