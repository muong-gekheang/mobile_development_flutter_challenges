import 'package:challenge/spotify_player_state/model/artists/artist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;
  final VoidCallback onTap;
  const ArtistTile({super.key, required this.artist, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(artist.imageUrl),
            radius: 15,
          ),
          title: Text(artist.name),
          subtitle: Text(artist.genre),
        ),
      ),
    );
  }
}
