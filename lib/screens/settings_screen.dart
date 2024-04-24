import 'package:flutter/material.dart';
import 'package:weather_mobile_app/widgets/custom_drop_button.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String temperatureUnit = 'Celsius';

  String windSpeedUnit = 'm/s';

  String pressureUnit = 'hPa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                // Navigator.of(context).pop();
              },
              child: Ink(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropButton(
                          title: 'Temperature Units',
                          items: const ['Celsius', 'Fahrenheit', 'Kelvin'],
                          value: temperatureUnit),
                      const SizedBox(height: 16),
                      CustomDropButton(
                          title: 'Wind Speed Units',
                          items: const ['m/s', 'km/h', 'mph'],
                          value: windSpeedUnit),
                      const SizedBox(height: 16),
                      CustomDropButton(
                          title: 'Pressure Units',
                          items: const ['hPa', 'mmHg', 'inHg'],
                          value: pressureUnit),
                      Row(children: [
                        const Expanded(child: SizedBox(height: 16)),
                        ElevatedButton(
                          onPressed: () {
                            // save settings
                          },
                          child: const Text('Save'),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
