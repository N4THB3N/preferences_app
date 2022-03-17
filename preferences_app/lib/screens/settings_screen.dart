import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = Preferences.isDarkMode;
  // int gender = 1;
  // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.isDarkMode,
                  title: const Text('DarkMode'),
                  onChanged: (value) {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    value
                        ? themeProvider.setDarkMode
                        : themeProvider.setLightMode();
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: Text('Male'),
                  onChanged: (value) {
                    setState(() {
                      Preferences.gender = value ?? 1;
                    });
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  title: Text('Female'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  initialValue: 'Natan',
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      labelText: 'Name', helperText: 'Username'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
