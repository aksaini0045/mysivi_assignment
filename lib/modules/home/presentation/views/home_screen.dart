import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/core/constants/app_colors.dart';
import 'package:mysivi_chat_app/core/utils/extensions/widget_extensions.dart';
import 'package:mysivi_chat_app/di.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/users_cubit/users_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/widgets/tab_bar_widget.dart';
import 'package:mysivi_chat_app/modules/home/presentation/widgets/user_list_widget.dart';
import 'package:mysivi_chat_app/modules/home/presentation/widgets/chat_history_list_widget.dart';
import 'package:mysivi_chat_app/modules/home/presentation/widgets/add_user_sheet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //added this provider here so that it becomes accesible to both screen and add user sheet
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DI.instance.userListCubit),
        BlocProvider(create: (context) => DI.instance.chatsHistoryCubit),
      ],

      child: Builder(builder: (context) => _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final currentTabIndex = context.watch<HomeCubit>().state.currentTabBarIndex;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 0,
              surfaceTintColor: Colors.white,
              pinned: false,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabBarWidget(
                      selectedIndex: currentTabIndex,
                      onChanged: (index) {
                        context.read<HomeCubit>().changeTabBarIndex(index);
                      },
                    ).paddingOnly(bottom: 4, top: 4),
                    Container(height: 1, color: Colors.grey.shade300),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: currentTabIndex == 0
                    ? const UserListWidget(key: PageStorageKey('users_list'))
                    : const ChatHistoryListWidget(
                        key: PageStorageKey('chat_history_list'),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: currentTabIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _showAddUserSheet(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              backgroundColor: AppColors.primaryBlue500,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  void _showAddUserSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<UserListCubit>(),
        child: const AddUserSheetWidget(),
      ),
    );
  }
}
