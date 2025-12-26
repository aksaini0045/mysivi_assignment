import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';

abstract class UsersListRepository {
  Future<List<UserEntity>> getUsersList();
}
