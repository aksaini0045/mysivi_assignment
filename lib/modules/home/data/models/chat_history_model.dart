import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';

class ChatHistoryModel extends ChatHistoryEntity {
  // will have other things also like fromJson

  ChatHistoryModel({
    super.id,
    super.lastMessage,
    super.lastMessageTime,
    super.unreadMessageCount,
    super.userName,
  });
}
