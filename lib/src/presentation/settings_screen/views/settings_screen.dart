import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:rick_and_morty_app/src/presentation/settings_screen/cubit/theme/theme_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends StatefulWidget {
  @override
  State<_SettingsScreen> createState() => __SettingsScreen();
}

class __SettingsScreen extends State<_SettingsScreen> {
  bool isDarkMode = false;
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    getAppVersion();
  }

  Future<void> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Dark Mode ',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                    if (isDarkMode) {
                      final cubit = context.read<ThemeCubit>();
                      cubit.toggleTheme();
                    } else {
                      final cubit = context.read<ThemeCubit>();
                      cubit.toggleTheme();
                    }
                  },
                ),
              ],
            ),
            Text(
              'App Version: $appVersion',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
