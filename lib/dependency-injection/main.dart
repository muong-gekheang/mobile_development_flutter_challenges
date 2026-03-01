import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherService {
  final int temperature;

  WeatherService({required this.temperature});
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider(
        create: (context) {
          return WeatherService(temperature: 35);
        },
        child: WeatherApp(),
      ),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = context.read<WeatherService>();
    return Text(weatherService.temperature.toString());
  }
}
