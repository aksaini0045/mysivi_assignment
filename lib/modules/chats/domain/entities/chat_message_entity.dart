import 'package:equatable/equatable.dart';

enum ChatMessageType { sent, received }

enum ChatMessageStatus { sending, delivered, read }

class ChatMessageEntity extends Equatable {
  final String? id;
  final String? text;
  final ChatMessageType? type;
  final DateTime? timestamp;
  final ChatMessageStatus? status;

  const ChatMessageEntity({
    this.id,
    this.text,
    this.type,
    this.timestamp,
    this.status,
  });

  ChatMessageEntity copyWith({ChatMessageStatus? status}) {
    return ChatMessageEntity(
      id: id,
      text: text,
      type: type,
      status: status ?? this.status,
      timestamp: timestamp,
    );
  }

  @override
  List<Object?> get props => [status];
}
