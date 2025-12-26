import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/di.dart';
import 'package:mysivi_chat_app/modules/chats/presentation/views/chat_screen.dart';
import 'package:mysivi_chat_app/modules/home/domain/entities/user_entity.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/views/main_screen.dart';

class AppRoutes {
  static const mainRoute = '/';
  static const chatRoute = '/chatRoute';

  static Map<String, WidgetBuilder> routes = {
    mainRoute: (context) =>
        BlocProvider(create: (context) => HomeCubit(), child: MainScreen()),
    chatRoute: (context) => BlocProvider(
      create: (context) => DI.instance.chatCubit,
      child: ChatScreen(
        // passing complete user entity for now
        user: ModalRoute.of(context)?.settings.arguments as UserEntity,
      ),
    ),
  };
}
