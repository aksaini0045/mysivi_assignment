import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mysivi_chat_app/core/utils/extensions/widget_extensions.dart';
import 'package:mysivi_chat_app/core/utils/helpers/time_formatter.dart';
import 'package:mysivi_chat_app/modules/chats/domain/entities/chat_message_entity.dart';

import '../../../../core/constants/app_colors.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessageEntity message;
  final String userName;
  final Function(String word) onWordTapped;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.userName,
    required this.onWordTapped,
  });

  @override
  Widget build(BuildContext context) {
    final isReceived = message.type == ChatMessageType.received;

    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: isReceived
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isReceived) ...[
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primaryBlue500, Colors.purple.shade400],
              ),
            ),
            child: Center(
              child: Text(
                userName[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth * 0.65),
            child: Column(
              crossAxisAlignment: isReceived
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isReceived
                        ? Colors.grey.shade200
                        : AppColors.primaryBlue500,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isReceived ? 4 : 10),
                      topRight: Radius.circular(isReceived ? 10 : 4),
                      bottomLeft: const Radius.circular(10),
                      bottomRight: const Radius.circular(10),
                    ),
                  ),
                  child: _tappableSentenceWidget(
                    message.text ?? '',
                    isReceived ? Colors.black : Colors.white,
                  ).paddingSymmetric(horizontal: 16, vertical: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      timeFormatter(message.timestamp),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                    if (!isReceived) ...[
                      const SizedBox(width: 4),
                      Icon(
                        message.status == ChatMessageStatus.read
                            ? Icons.done_all
                            : message.status == ChatMessageStatus.delivered
                            ? Icons.done_all
                            : Icons.done,
                        size: 14,
                        color: message.status == ChatMessageStatus.read
                            ? AppColors.primaryBlue500
                            : Colors.grey.shade600,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        if (!isReceived) ...[
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple.shade400, Colors.pink.shade400],
              ),
            ),
            child: const Center(
              child: Text(
                'Y',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _tappableSentenceWidget(String sentence, Color textColor) {
    final words = sentence.split(RegExp(r'\s+'));

    return RichText(
      text: TextSpan(
        style: TextStyle(color: textColor, fontSize: 14),
        children: words.map((word) {
          return TextSpan(
            text: '$word ',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('Tapped word: $word');
                onWordTapped.call(word);
              },
          );
        }).toList(),
      ),
    );
  }
}
