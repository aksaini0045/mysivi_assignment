import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysivi_chat_app/core/constants/app_colors.dart';
import 'package:mysivi_chat_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySivi Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
      ),
      initialRoute: AppRoutes.mainRoute,
      routes: AppRoutes.routes,
    );
  }
}
