import 'package:flutter/material.dart';

class WeatherDataCalc extends StatelessWidget {
  const WeatherDataCalc({super.key, required this.time});

  final int time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Time of Data Calculation',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${DateTime.fromMillisecondsSinceEpoch(time * 1000).toLocal().toString().substring(11, 16)}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
