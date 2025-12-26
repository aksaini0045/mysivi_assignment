import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/chats/domain/entities/chat_message_entity.dart';
import 'package:mysivi_chat_app/modules/chats/domain/user_cases/get_random_receiver_msg.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/cubits/chat_cubit_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  final GetRandomReceiverMsg _getRandomReceiverMsg;

  // using this temp chats list to show on UI.. can fetched using data sources... for now i am keeping here just for this assignment

  ChatCubit(this._getRandomReceiverMsg)
    : super(
        ChatCubitState(false, [
          ChatMessageEntity(
            id: '1',
            status: ChatMessageStatus.read,
            type: ChatMessageType.sent,
            text: "Hi Anuj, how are you",
            timestamp: DateTime.now().subtract(Duration(minutes: 1)),
          ),
          ChatMessageEntity(
            id: '2',
            status: ChatMessageStatus.read,
            type: ChatMessageType.received,
            text: "Hello I am good",
            timestamp: DateTime.now(),
          ),
        ]),
      );

  void sendMessage(String message) async {
    final sentMessageId = DateTime.now().microsecondsSinceEpoch.toString();
    final newMessage = ChatMessageEntity(
      id: sentMessageId,
      type: ChatMessageType.sent,
      text: message,
      status: ChatMessageStatus.sending,
      timestamp: DateTime.now(),
    );

    emit(
      state.copyWith(
        isTyping: false,
        messagesList: [...state.messagesList, newMessage],
      ),
    );
    // adding some delays to look like real chat
    await Future.delayed(Duration(milliseconds: 200));
    _loadRandomMessage();

    await _updateSendingMessage(sentMessageId, ChatMessageStatus.delivered);
    _updateSendingMessage(sentMessageId, ChatMessageStatus.read);
  }

  Future _updateSendingMessage(String id, ChatMessageStatus status) async {
    await Future.delayed(Duration(milliseconds: 500), () {
      final list = List<ChatMessageEntity>.from(state.messagesList);
      final index = list.indexWhere((element) => element.id == id);
      if (index != -1) {
        list[index] = list[index].copyWith(status: status);
        emit(state.copyWith(messagesList: list));
      }
    });
  }

  void _loadRandomMessage() async {
    try {
      emit(state.copyWith(isTyping: true));

      final value = await _getRandomReceiverMsg.call();

      final newMessage = ChatMessageEntity(
        id: "received_${DateTime.now().microsecondsSinceEpoch.toString()}",
        status: ChatMessageStatus.read,
        text: value,
        timestamp: DateTime.now(),
        type: ChatMessageType.received,
      );
      emit(
        state.copyWith(
          isTyping: false,
          messagesList: [...state.messagesList, newMessage],
        ),
      );
    } catch (e) {
      // use bloc here to show popups related to errors..
      // i am just using simple approach for assignment purpose
      emit(state.copyWith(isTyping: false));
      debugPrint(e.toString());
    }
  }
}
