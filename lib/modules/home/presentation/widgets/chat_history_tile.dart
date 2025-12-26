import 'package:flutter/material.dart';
import 'package:mysivi_chat_app/core/constants/app_colors.dart';
import 'package:mysivi_chat_app/core/utils/helpers/time_ago_formatter.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/chat_history_entity.dart';

class ChatHistoryTile extends StatelessWidget {
  final ChatHistoryEntity chat;

  const ChatHistoryTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final String firstLetter = (chat.userName?.isNotEmpty ?? false)
        ? chat.userName![0].toUpperCase()
        : '';

    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 91, 247, 221),
                const Color.fromARGB(255, 4, 138, 120),
              ],
            ),
          ),
          child: Center(
            child: Text(
              firstLetter,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    chat.userName ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    timeAgoFormatter(chat.lastMessageTime),
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      chat.lastMessage ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (chat.unreadMessageCount != null &&
                      chat.unreadMessageCount! > 0) ...[
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.primaryBlue,
                      child: Text(
                        '${chat.unreadMessageCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
