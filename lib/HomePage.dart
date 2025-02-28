import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackster_music/SearchScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MusicProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackster',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Заменяет bodyText1
          titleLarge: TextStyle(color: Colors.white, fontSize: 20), // Заменяет headline6
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trackster'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader('Recommended Tracks'),
                _buildTrackList(musicProvider.tracks),
                _buildSectionHeader('Your Playlists'),
                _buildPlaylistGrid(),
                _buildSectionHeader('Recently Played'),
                _buildTrackList(musicProvider.tracks),
              ],
            ),
          ),
          SearchScreen(),
          Scaffold(),
          Scaffold(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _openPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );

  }
  void _openPage(int index){
    setState(()=>  _selectedPageIndex = index);
  }
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildTrackList(List<String> tracks) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.music_note, color: Colors.white),
          title: Text(tracks[index], style: TextStyle(color: Colors.white)),
          onTap: () {
            // Логика воспроизведения трека
          },
        );
      },
    );
  }

  Widget _buildPlaylistGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          child: Center(
            child: Text(
              'Playlist ${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
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