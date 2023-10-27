import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

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
                    // Toggle dark mode
                    if (isDarkMode) {
                      SystemChrome.setSystemUIOverlayStyle(
                          SystemUiOverlayStyle.light);
                    } else {
                      SystemChrome.setSystemUIOverlayStyle(
                          SystemUiOverlayStyle.dark);
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
