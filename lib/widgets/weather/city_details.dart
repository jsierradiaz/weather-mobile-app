import 'package:flutter/material.dart';
import 'package:weather_mobile_app/models/weather_forecast.dart';

class CityDetails extends StatelessWidget {
  const CityDetails({
    super.key,
    required this.city,
    required this.country,
    required this.coord,
    required this.population,
  });

  final String city;
  final String country;
  final Coord coord;
  final num population;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'City Details',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'City:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    Text(
                      city,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    Text(
                      country,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Latitude',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    Text(
                      coord.lat.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Longitude',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    Text(
                      coord.lon.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Population',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    Text(
                      population.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
