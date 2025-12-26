import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';
import 'package:mysivi_chat_app/modules/home/domain/use_cases/get_chat_history_list.dart';

class ChatHistoryCubit extends Cubit<List<ChatHistoryEntity>> {
  final GetChatHistoryList _chatHistoryList;
  ChatHistoryCubit(this._chatHistoryList) : super([]);

  void loadChatHistory() async {
    final List<ChatHistoryEntity> chats = await _chatHistoryList.call();
    emit([...state, ...chats]);
  }
}
