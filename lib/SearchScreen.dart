import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          _buildSearchField(context),
          Expanded(
            child: ListView.builder(
             // itemCount: musicProvider.searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.music_note, color: Colors.white),
                  /*title: Text(
                    musicProvider.searchResults[index],
                    style: TextStyle(color: Colors.white),
                  ),

                   */
                  onTap: () {
                    // Логика воспроизведения трека
                  },
                );
              },
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildSearchField(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (query) {
         // musicProvider.searchTracks(query); // Обновляем результаты поиска
        },
        decoration: InputDecoration(
          hintText: 'Search tracks, artists, playlists...',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}