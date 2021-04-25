import 'package:devquiz/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            value: SettingsController.instance.isDarkTheme,
            onChanged: (value) {
              SettingsController.instance.changeTheme();
            },
          ),
        ]),
      ),
    );
  }
}
