import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';
import 'package:mysivi_chat_app/modules/home/domain/repositories/users_list_repository.dart';

class GetUsersList {
  final UsersListRepository usersListRepository;

  GetUsersList(this.usersListRepository);

  Future<List<UserEntity>> call() {
    return usersListRepository.getUsersList();
  }
}
