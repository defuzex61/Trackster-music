import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackster_music/router/router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MusicProvider(),
      child: const TracksterApp(),
    ),
  );
}

class TracksterApp extends StatefulWidget {
  const TracksterApp({super.key});

  @override
  State<TracksterApp> createState() => _TracksterAppState();
}

class _TracksterAppState extends State<TracksterApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trackster',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Заменяет bodyText1
          titleLarge: TextStyle(color: Colors.white, fontSize: 20), // Заменяет headline6
        ),
      ),
      routerConfig: _router.config(),
    );
  }
}


class MusicProvider with ChangeNotifier {
  List<String> _tracks = ['Track 1', 'Track 2', 'Track 3'];
  List<String> get tracks => _tracks;

  void loadTracks() {
    // Логика загрузки треков
    notifyListeners();
  }

}