import 'package:challenge/w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenge/w7_small_homework/model/songs/song.dart';
import 'package:challenge/w7_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:challenge/w7_small_homework/ui/states/player_state.dart';
import 'package:challenge/w7_small_homework/ui/states/settings_state.dart';
import 'package:challenge/w7_small_homework/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryViewModel = context.watch<LibraryViewModel>();
    final settingsState = context.watch<AppSettingsState>();
    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: libraryViewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: libraryViewModel.songs[index],
                isPlaying:
                    libraryViewModel.currentSong ==
                    libraryViewModel.songs[index],
                onTap: () {
                  libraryViewModel.playSong(libraryViewModel.songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<AppSettingsState>();
    final libraryViewModel = context.watch<LibraryViewModel>();
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: settingsState.theme.color),
          ),
          TextButton(
            onPressed: () {
              libraryViewModel.stopSong(song);
            },
            child: Text('STOP', style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }
}
