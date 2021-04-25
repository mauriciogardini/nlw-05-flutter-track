import 'package:devquiz/settings/settings_controller.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: SettingsController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            brightness: SettingsController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          title: "DevQuiz",
          home: SplashPage(),
        );
      },
    );
  }
}
