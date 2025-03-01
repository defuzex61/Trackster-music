import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../library/library.dart';
import '../../search/search.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _selectedPageIndex = 0;

  final _pageController = PageController();

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
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
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
          const SearchScreen(),
          const LibraryScreen(),
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
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut );
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
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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