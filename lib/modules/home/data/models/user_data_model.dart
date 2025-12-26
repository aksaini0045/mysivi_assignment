import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';

class UserDataModel extends UserEntity {
  // will have other things also like fromJson
  UserDataModel({super.id, super.isOnline, super.lastActive, super.userName});
}
