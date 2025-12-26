import 'package:mysivi_chat_app/modules/home/data/models/chat_history_model.dart';

abstract class ChatHistoryDataSource {
  Future<List<ChatHistoryModel>> loadChatHistory();
}

class ChatHistoryLocalSource implements ChatHistoryDataSource {
  @override
  Future<List<ChatHistoryModel>> loadChatHistory() async {
    // Fake data for chat history
    return [
      ChatHistoryModel(
        id: '1',
        userName: 'Alice Johnson',
        lastMessage: 'See you tomorrow!',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 2)),
        unreadMessageCount: 2,
      ),
      ChatHistoryModel(
        id: '2',
        userName: 'Bob Smith',
        lastMessage: 'Thanks for the help',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 10)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '3',
        userName: 'Carol Williams',
        lastMessage: 'Let\'s catch up soon',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
        unreadMessageCount: 1,
      ),
      ChatHistoryModel(
        id: '4',
        userName: 'David Brown',
        lastMessage: 'Got it, thanks!',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 3)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '5',
        userName: 'Emma Davis',
        lastMessage: 'Perfect, see you then',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 5)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '6',
        userName: 'Frank Miller',
        lastMessage: 'That sounds great',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '7',
        userName: 'Grace Wilson',
        lastMessage: 'I\'ll check it out',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '8',
        userName: 'Henry Moore',
        lastMessage: 'Sounds good to me',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '9',
        userName: 'Alice Johnson',
        lastMessage: 'See you tomorrow!',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 2)),
        unreadMessageCount: 2,
      ),
      ChatHistoryModel(
        id: '10',
        userName: 'Bob Smith',
        lastMessage: 'Thanks for the help',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 10)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '11',
        userName: 'Carol Williams',
        lastMessage: 'Let\'s catch up soon',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
        unreadMessageCount: 1,
      ),
      ChatHistoryModel(
        id: '12',
        userName: 'David Brown',
        lastMessage: 'Got it, thanks!',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 3)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '13',
        userName: 'Emma Davis',
        lastMessage: 'Perfect, see you then',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 5)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '14',
        userName: 'Frank Miller',
        lastMessage: 'That sounds great',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '15',
        userName: 'Grace Wilson',
        lastMessage: 'I\'ll check it out',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '16',
        userName: 'Henry Moore',
        lastMessage: 'Sounds good to me',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '17',
        userName: 'Emma Davis',
        lastMessage: 'Perfect, see you then',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 5)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '18',
        userName: 'Frank Miller',
        lastMessage: 'That sounds great',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '19',
        userName: 'Grace Wilson',
        lastMessage: 'I\'ll check it out',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadMessageCount: 0,
      ),
      ChatHistoryModel(
        id: '20',
        userName: 'Henry Moore',
        lastMessage: 'Sounds good to me',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
        unreadMessageCount: 0,
      ),
    ];
  }
}

// we can create a network source also
