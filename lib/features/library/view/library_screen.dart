import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:trackster_music/main.dart';

@RoutePage()
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _musicProvider = MusicProvider();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileButton(context),
            const SizedBox(height: 20),
            _buildSectionButton(Icons.favorite, 'Liked Tracks', () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LikedTracksScreen()),
              );

               */
            }),
            _buildSectionButton(Icons.playlist_play, 'Playlists', () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PlaylistsScreen()),
              );

               */
            }),
            _buildSectionButton(Icons.album, 'Albums', () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AlbumsScreen()),
              );

               */
            }),
            _buildSectionButton(Icons.subscriptions, 'Subscriptions', () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SubscriptionsScreen()),
              );

               */
            }),
            _buildSectionButton(Icons.settings, "Settings", ()=>{
              //Настройки
            }),
            SizedBox(height: 20),
            _buildSectionHeader("Recently listen"),
            _buildTrackList(_musicProvider.tracks),
          ],
        ),
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

  Widget _buildProfileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/profile.jpg'), // Путь к фото профиля
          radius: 30,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProfileScreen()),
          );

           */
        },
      ),
    );
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

  Widget _buildSectionButton(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 30),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onTap,
    );
  }


}