import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/users_cubit/users_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/widgets/user_list_tile.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListCubit, List<UserEntity>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text(
              'No users are there',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          itemBuilder: (context, index) {
            return UserListTile(user: state[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: state.length,
        );
      },
    );
  }
}
