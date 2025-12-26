import 'package:equatable/equatable.dart';

import '../../domain/entities/chat_message_entity.dart';

class ChatCubitState extends Equatable {
  final bool isTyping;
  final List<ChatMessageEntity> messagesList;

  const ChatCubitState(this.isTyping, this.messagesList);

   ChatCubitState copyWith({
    bool? isTyping,
    List<ChatMessageEntity>? messagesList,
  }) {
    return ChatCubitState(
      isTyping ?? this.isTyping,
      messagesList ?? this.messagesList,
    );
  }

  @override
  List<Object?> get props => [isTyping, messagesList];
}
