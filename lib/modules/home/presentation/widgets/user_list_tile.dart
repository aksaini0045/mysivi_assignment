import 'package:flutter/material.dart';
import 'package:mysivi_chat_app/core/constants/app_colors.dart';
import 'package:mysivi_chat_app/core/utils/helpers/time_ago_formatter.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';
import 'package:mysivi_chat_app/routes.dart';

class UserListTile extends StatelessWidget {
  final UserEntity user;

  const UserListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final String firstLetter = (user.userName?.isNotEmpty ?? false)
        ? user.userName![0].toUpperCase()
        : '';

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.chatRoute, arguments: user);
      },
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primaryBlue, Colors.purple.shade400],
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

              // Online indicator
              if (user.isOnline == true)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.userName ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                user.isOnline == true
                    ? 'Online'
                    : timeAgoFormatter(user.lastActive),
                style: TextStyle(
                  fontSize: 13,
                  color: user.isOnline == true ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
