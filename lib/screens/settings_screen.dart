import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      // body: InkWell(
      //   onTap: () {
      //     // Navigator.of(context).pop();
      //   },
      //   child: Card(
      //     margin: const EdgeInsets.all(16),
      //     child: Column(
      //       children: const [
      //         ListTile(
      //           title: Text('Temperature Units'),
      //           trailing: Text('Celsius'),
      //         ),
      //         ListTile(
      //           title: Text('Wind Speed Units'),
      //           trailing: Text('km/h'),
      //         ),
      //         ListTile(
      //           title: Text('Pressure Units'),
      //           trailing: Text('hPa'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
