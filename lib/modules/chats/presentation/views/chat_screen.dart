import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/core/utils/extensions/widget_extensions.dart';
import 'package:mysivi_chat_app/di.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/cubits/chat_cubit.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/cubits/chat_cubit_state.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/widgets/chat_message_bubble.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/widgets/chat_input_field.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/widgets/word_meaning_bottom_sheet.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';

class ChatScreen extends StatefulWidget {
  final UserEntity user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = .new();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      context.read<ChatCubit>().sendMessage(message);
      _messageController.clear();
    }
  }

  void _showWordMeaningSheet(String word) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider(
        create: (context) => DI.instance.wordMeanBloc(word),
        child: WordMeaningBottomSheet(word: word),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade400, Colors.purple.shade400],
                ),
              ),
              child: Center(
                child: Text(
                  widget.user.userName?[0].toUpperCase() ?? 'U',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.userName ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.user.isOnline == true ? 'Online' : 'Offline',
                  style: TextStyle(
                    color: widget.user.isOnline == true
                        ? Colors.green
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(height: 1, color: Colors.grey.shade300),
          Expanded(
            child: BlocBuilder<ChatCubit, ChatCubitState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        itemCount: state.messagesList.length,
                        itemBuilder: (context, index) {
                          final reversedIndex =
                              state.messagesList.length - 1 - index;
                          final message = state.messagesList[reversedIndex];
                          return ChatMessageBubble(
                            message: message,
                            userName: widget.user.userName ?? 'Unknown',
                            onWordTapped: _showWordMeaningSheet,
                          ).paddingOnly(bottom: 15);
                        },
                      ),
                    ),
                    if (state.isTyping)
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue.shade400,
                                  Colors.purple.shade400,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                widget.user.userName?[0].toUpperCase() ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              "...typing",
                            ).paddingSymmetric(horizontal: 16, vertical: 12),
                          ),
                        ],
                      ).paddingOnly(left: 16, right: 16, bottom: 12),
                  ],
                );
              },
            ),
          ),
          Container(height: 1, color: Colors.grey.shade300),
          ChatInputField(controller: _messageController, onSend: _sendMessage),
        ],
      ),
    );
  }
}
