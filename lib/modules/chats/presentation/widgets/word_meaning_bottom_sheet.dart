import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/core/utils/extensions/widget_extensions.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc_states.dart';

class WordMeaningBottomSheet extends StatelessWidget {
  final String word;

  const WordMeaningBottomSheet({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    word,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ).paddingAll(16),
            const Divider(height: 1),
            BlocBuilder<WordMeanBloc, WordMeanBlocStates>(
              builder: (context, state) {
                if (state is LoadingWordMeaningState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  ).paddingSymmetric(horizontal: 25, vertical: 30);
                } else if (state is LoadedWordMeaningState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Meaning',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.wordMeanEntity.mean ?? 'No meaning found',
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ).paddingAll(16);
                } else if (state is ErrorLoadingWordMeanState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: .center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 40,
                        color: Colors.red.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Failed to load meaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ).paddingAll(16);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
