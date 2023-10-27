import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
