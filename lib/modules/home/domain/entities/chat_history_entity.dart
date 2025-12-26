class ChatHistoryEntity {
  final String? id;
  final String? userName;
  final String? lastMessage;
  final int? unreadMessageCount;
  final DateTime? lastMessageTime;

  ChatHistoryEntity({
    this.id,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadMessageCount,
    this.userName,
  });
}
