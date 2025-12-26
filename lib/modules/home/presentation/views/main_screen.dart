import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:mysivi_chat_app/modules/home/presentation/views/home_screen.dart';
import 'package:mysivi_chat_app/modules/home/presentation/views/placeholder_screen.dart';

import '../../../../core/constants/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final selectedBottomIndex = context
        .watch<HomeCubit>()
        .state
        .currentBottomIndex;
    return IndexedStack(
      index: selectedBottomIndex,
      children: [
        HomeScreen(),
        PlaceholderScreen(title: 'Offers'),
        PlaceholderScreen(title: 'Settings'),
      ],
    );
  }

  Widget _bottomBar(BuildContext context) {
    final currentIndex = context.watch<HomeCubit>().state.currentBottomIndex;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              icon: Icons.chat,
              label: 'Home',
              index: 0,
              isSelected: currentIndex == 0,
            ),
            _buildNavItem(
              context,
              icon: Icons.local_offer_outlined,
              label: 'Offers',
              index: 1,
              isSelected: currentIndex == 1,
            ),
            _buildNavItem(
              context,
              icon: Icons.settings_outlined,
              label: 'Settings',
              index: 2,
              isSelected: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().changeBottomBarIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryBlue : Colors.grey.shade600,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryBlue
                    : Colors.grey.shade600,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
