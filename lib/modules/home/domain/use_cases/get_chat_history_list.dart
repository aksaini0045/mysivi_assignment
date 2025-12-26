import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';
import 'package:mysivi_chat_app/modules/home/domain/repositories/chat_history_list_repository.dart';

class GetChatHistoryList {
  final ChatHistoryListRepository chatHistoryListRepository;

  GetChatHistoryList(this.chatHistoryListRepository);

  Future<List<ChatHistoryEntity>> call() {
    return chatHistoryListRepository.getChatHistory();
  }
}
