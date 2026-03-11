import 'package:challenge/w8_future_repo/utils/async_value_state.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  AsyncValue<List<Song>> songValue = AsyncValue.loading();

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    fetchSongs();
  }



  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }


  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();

  void fetchSongs() async {
    songValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Song> songs = await songRepository.fetchSongs();
      songValue = AsyncValue.success(songs);

      //  throw Exception("Simulated fetch error"); 
    } catch (e) {
      songValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
