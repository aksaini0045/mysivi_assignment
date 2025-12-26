import 'package:mysivi_chat_app/modules/home/data/models/user_data_model.dart';

abstract class UserDataSource {
  Future<List<UserDataModel>> getUsersList();
}

class UsersLocalDataSource extends UserDataSource {
  @override
  Future<List<UserDataModel>> getUsersList() async {
    return [
      UserDataModel(
        id: '1',
        userName: 'Carol Williams',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
      UserDataModel(
        id: '2',
        userName: 'John Miller',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      UserDataModel(
        id: '3',
        userName: 'Sophia Brown',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      UserDataModel(
        id: '4',
        userName: 'Liam Johnson',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
      UserDataModel(
        id: '5',
        userName: 'Emma Davis',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(days: 1)),
      ),
      UserDataModel(
        id: '6',
        userName: 'Noah Wilson',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(days: 3)),
      ),
      UserDataModel(
        id: '7',
        userName: 'Olivia Martinez',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
      UserDataModel(
        id: '8',
        userName: 'James Anderson',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(minutes: 45)),
      ),
      UserDataModel(
        id: '9',
        userName: 'Ava Thompson',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(hours: 10)),
      ),
      UserDataModel(
        id: '10',
        userName: 'Ethan Moore',
        isOnline: true,
        lastActive: DateTime.now(),
      ),

      UserDataModel(
        id: '11',
        userName: 'Carol Williams',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
      UserDataModel(
        id: '12',
        userName: 'John Miller',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      UserDataModel(
        id: '13',
        userName: 'Sophia Brown',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      UserDataModel(
        id: '14',
        userName: 'Liam Johnson',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
      UserDataModel(
        id: '15',
        userName: 'Emma Davis',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(days: 1)),
      ),
      UserDataModel(
        id: '16',
        userName: 'Noah Wilson',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(days: 3)),
      ),
      UserDataModel(
        id: '17',
        userName: 'Olivia Martinez',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
      UserDataModel(
        id: '18',
        userName: 'James Anderson',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(minutes: 45)),
      ),
      UserDataModel(
        id: '19',
        userName: 'Ava Thompson',
        isOnline: false,
        lastActive: DateTime.now().subtract(const Duration(hours: 10)),
      ),
      UserDataModel(
        id: '20',
        userName: 'Ethan Moore',
        isOnline: true,
        lastActive: DateTime.now(),
      ),
    ];
  }
}

// we can create a network source also
