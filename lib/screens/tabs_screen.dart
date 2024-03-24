import 'package:flutter/material.dart';
import 'package:weather_mobile_app/screens/about_screen.dart';
import 'package:weather_mobile_app/screens/settings_screen.dart';
import 'package:weather_mobile_app/screens/weather.dart';
import 'package:weather_mobile_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  Widget activeScreen = const Weather();
  String title = 'Weather App';

  void _setScreen(String screen) {
    Navigator.of(context).pop();

    // switch statement to set the active screen
    switch (screen) {
      case 'WeatherScreen':
        title = 'Weather App';
        setState(() {
          activeScreen = const Weather();
        });
        break;
      case 'SettingsScreen':
        title = 'Settings';
        setState(() {
          activeScreen = const SettingsScreen();
        });
        break;
      case 'AboutScreen':
        title = 'About';
        setState(() {
          activeScreen = const AboutScreen();
        });
        break;
      default:
        title = 'Weather App';
        setState(() {
          activeScreen = const Weather();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen),
      body: activeScreen,
    );
  }
}
