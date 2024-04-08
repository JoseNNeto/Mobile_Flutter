import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String _cityName = 'Recife'; // Você pode mudar para a cidade que deseja obter informações
  final String _apiKey = '401aaacbd62c9aed99cb3ca5078dd912'; // Substitua por sua própria chave de API

  String _temperature = '';
  String _description = '';

  void fetchWeather() async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$_apiKey&units=metric')
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _temperature = '${jsonData['main']['temp']}°C';
        _description = jsonData['weather'][0]['description'];
      });
    } else {
      setState(() {
        _temperature = 'Erro ao obter temperatura';
        _description = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _cityName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Temperatura: $_temperature',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Condições: $_description',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}