import 'package:flutter/material.dart';

class Sunrise extends StatelessWidget {
  final int sunrise;
  final int sunset;

  const Sunrise({super.key, required this.sunrise, required this.sunset});

  @override
  Widget build(BuildContext context) {
    var sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000)
        .toLocal()
        .toString()
        .substring(11, 16);
    var sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000)
        .toLocal()
        .toString()
        .substring(11, 16);

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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sunrise',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox(width: 10)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sunset',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    sunriseTime,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 10)),
                  Text(
                    sunsetTime,
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
