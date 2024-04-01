import 'package:flutter/material.dart';

class Humidity extends StatelessWidget {
  final int humidity;
  const Humidity({Key? key, required this.humidity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        //width: 150,
        child: InkWell(
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
                        'Humidity',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${humidity.toStringAsFixed(0)}%',
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
        ),
      ),
    );
  }
}
