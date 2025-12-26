import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/chat_history_cubit/chat_history_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/widgets/chat_history_tile.dart';

class ChatHistoryListWidget extends StatelessWidget {
  const ChatHistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // adding the provider here bcs its used here only
    return BlocBuilder<ChatHistoryCubit, List<ChatHistoryEntity>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text(
              'No chat history yet',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          itemBuilder: (context, index) {
            return ChatHistoryTile(chat: state[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: state.length,
        );
      },
    );
  }
}
