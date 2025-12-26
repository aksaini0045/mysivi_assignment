import 'package:dio/dio.dart';
import 'package:mysivi_chat_app/core/network/dio_client.dart';
import 'package:mysivi_chat_app/modules/chats/data/data_sources/message_data_source.dart';
import 'package:mysivi_chat_app/modules/chats/data/data_sources/word_mean_data_source.dart';
import 'package:mysivi_chat_app/modules/chats/data/repositories/chat_respostory_impl.dart';
import 'package:mysivi_chat_app/modules/chats/data/repositories/word_mean_repo_impl.dart';
import 'package:mysivi_chat_app/modules/chats/domain/repositories/chat_repository.dart';
import 'package:mysivi_chat_app/modules/chats/domain/repositories/word_mean_respository.dart';
import 'package:mysivi_chat_app/modules/chats/domain/user_cases/get_random_receiver_msg.dart';
import 'package:mysivi_chat_app/modules/chats/domain/user_cases/get_word_meaning.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/blocs/word_mean_bloc/word_mean_bloc_events.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/cubits/chat_cubit.dart';
import 'package:mysivi_chat_app/modules/home/data/data_sources/chat_history_data_source.dart';
import 'package:mysivi_chat_app/modules/home/data/data_sources/user_data_source.dart';
import 'package:mysivi_chat_app/modules/home/data/repositories/chat_history_list_repo_impl.dart';
import 'package:mysivi_chat_app/modules/home/data/repositories/user_list_repo_impl.dart';
import 'package:mysivi_chat_app/modules/home/domain/repositories/chat_history_list_repository.dart';
import 'package:mysivi_chat_app/modules/home/domain/repositories/users_list_repository.dart';
import 'package:mysivi_chat_app/modules/home/domain/use_cases/get_chat_history_list.dart';
import 'package:mysivi_chat_app/modules/home/domain/use_cases/get_users_list.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/chat_history_cubit/chat_history_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/users_cubit/users_cubit.dart';

class DI {
  // for now i am skipping get_it
  // managing dependencies using simple instances

  DI._privateContructor();

  static final _instance = DI._privateContructor();

  static DI get instance => _instance;

  Dio get _getDioInstance {
    // dio client instance
    return DioClient.create();
  }

  UserListCubit get userListCubit {
    // users List cubit for home screen
    final UserDataSource userDataSource = UsersLocalDataSource();
    final UsersListRepository usersListRepository = UserListRepoImpl(
      userDataSource,
    );
    final GetUsersList getUsersList = GetUsersList(usersListRepository);
    return UserListCubit(getUsersList)..loadUsers();
  }

  ChatHistoryCubit get chatsHistoryCubit {
    // chat history cubit for home screen
    final ChatHistoryDataSource dataSource = ChatHistoryLocalSource();
    final ChatHistoryListRepository repository = ChatHistoryListRepoImpl(
      dataSource,
    );
    final GetChatHistoryList useCase = GetChatHistoryList(repository);
    return ChatHistoryCubit(useCase)..loadChatHistory();
  }

  ChatCubit get chatCubit {
    // chat cubit for chat/messaging screen
    final RandomMessageDataSource dataSource = RandomMessageNetworkSource(
      _getDioInstance,
    );
    final ChatRepository repository = ChatRespostoryImpl(dataSource);
    final GetRandomReceiverMsg useCase = GetRandomReceiverMsg(repository);
    return ChatCubit(useCase);
  }

  WordMeanBloc wordMeanBloc(String word) {
    final WordMeanDataSource dataSource = WordMeanNetworkSorce(_getDioInstance);
    final WordMeanRespository repository = WordMeanRepoImpl(dataSource);
    final GetWordMeaning useCase = GetWordMeaning(repository);
    return WordMeanBloc(useCase)..add(LoadWordMeaningEvent(word));
  }
}
