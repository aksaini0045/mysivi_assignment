import 'package:flutter/material.dart';
import 'package:mysivi_chat_app/core/utils/extensions/widget_extensions.dart';

class TabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const TabBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildTab('Users', 0), _buildTab('Chat History', 1)],
      ).paddingSymmetric(horizontal: 6, vertical: 5),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = selectedIndex == index;
    return Flexible(
      child: GestureDetector(
        onTap: () => onChanged(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey.shade600,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 15,
            ),
          ).paddingSymmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}
