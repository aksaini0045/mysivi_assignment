import 'package:flutter/material.dart';

/// App-wide color constants
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primaryBlue = Color(0xFF42A5F5);
  static const Color primaryBlue500 = Color(0xFF2196F3);
  static const Color primaryPurple = Color(0xFFAB47BC);
  static const Color primaryPink = Color(0xFFEC407A);

  // Custom Teal Colors (chat history avatar)
  static const Color tealLight = Color.fromARGB(255, 91, 247, 221);
  static const Color tealDark = Color.fromARGB(255, 4, 138, 120);

  // Gradients
  static List<Color> get userAvatarGradient => [primaryBlue, primaryPurple];
  static List<Color> get chatHistoryGradient => [tealLight, tealDark];
  static List<Color> get sentMessageGradient => [primaryBlue, primaryPurple];
  static List<Color> get receivedMessageGradient => [
    primaryPurple,
    primaryPink,
  ];
}
