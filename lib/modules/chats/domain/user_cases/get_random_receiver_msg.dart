import 'package:mysivi_chat_app/modules/chats/domain/repositories/chat_repository.dart';

class GetRandomReceiverMsg {
  final ChatRepository _repository;

  GetRandomReceiverMsg(this._repository);

  Future<String> call() {
    return _repository.getRandomReceivedMessage();
  }
}
