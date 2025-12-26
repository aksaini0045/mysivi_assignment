import 'package:mysivi_chat_app/modules/home/data/data_sources/user_data_source.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';
import 'package:mysivi_chat_app/modules/home/domain/repositories/users_list_repository.dart';

class UserListRepoImpl implements UsersListRepository {
  final UserDataSource userDataSource;
  UserListRepoImpl(this.userDataSource);

  @override
  Future<List<UserEntity>> getUsersList() async {
    return userDataSource.getUsersList();
  }
}
