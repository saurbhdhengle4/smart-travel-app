import 'package:flutter/material.dart';
import '../data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${weather.temperature.toStringAsFixed(1)}°C', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text(weather.description),
            Text('Wind: ${weather.windSpeed.toStringAsFixed(1)} km/h'),
          ],
        ),
      ),
    );
  }
}