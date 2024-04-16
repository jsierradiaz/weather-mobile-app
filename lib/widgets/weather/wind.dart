import 'package:flutter/material.dart';

class Wind extends StatelessWidget {
  final String speed;
  final int degree;

  const Wind({Key? key, required this.speed, required this.degree})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
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
                        'Wind',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          '$speed mph',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${degree.toString()}°',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
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
