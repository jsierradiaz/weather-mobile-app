import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});

  final void Function(String identifier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(
              'Weather App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Weather'),
            onTap: () {
              onSelectedScreen('WeatherScreen');
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              onSelectedScreen('SettingsScreen');
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              onSelectedScreen('AboutScreen');
            },
          ),
        ],
      ),
    );
  }
}
