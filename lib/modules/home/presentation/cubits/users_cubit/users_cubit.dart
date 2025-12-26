import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';
import 'package:mysivi_chat_app/modules/home/domain/use_cases/get_users_list.dart';

class UserListCubit extends Cubit<List<UserEntity>> {
  final GetUsersList _getUsersList;
  UserListCubit(this._getUsersList) : super([]);

  void loadUsers() async {
    final List<UserEntity> users = await _getUsersList.call();

    emit([...state, ...users]);
  }

  void addNewUser(String name) {
    final newUser = UserEntity(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      isOnline: true,
      lastActive: DateTime.now(),
      userName: name,
    );

    emit([newUser, ...state]);
  }
}
