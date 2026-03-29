import 'package:challenge/spotify_player_state/model/artists/artist.dart';
import 'package:challenge/w9_firebase/ui/utils/time_converter.dart';
import 'package:flutter/material.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.artist,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(song.imageUrl),
            radius: 15,
          ),
          title: Text(song.title),
          subtitle: Row(
            children: [
              Text('${TimeConverter.msConverter(song.duration)} mins'),
              SizedBox(width: 12),
              Expanded(child: Text('${artist.name} - ${artist.genre}')),
              
            ],
          ),
          trailing: Row(
            children: [
              IconButton(
                onPressed: () {
                  print('The favorite icon is pressed');
                },
                icon: Icon(Icons.favorite),
              ),
              Text(
                isPlaying ? "Playing" : "",
                style: TextStyle(color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
