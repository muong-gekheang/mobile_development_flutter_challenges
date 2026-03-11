import 'package:challenge/w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenge/w7_small_homework/model/songs/song.dart';
import 'package:challenge/w7_small_homework/ui/states/player_state.dart';
import 'package:flutter/widgets.dart';

class LibraryViewModel extends ChangeNotifier {
  SongRepository songRepository;
  PlayerState playerState;

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    init();
    playerState.addListener(onPlayerChanged);
  }

  @override
  void dispose() {
    super.dispose();
    playerState.removeListener(onPlayerChanged);
  }

  List<Song> _songs = [];
  List<Song> get songs => _songs;
  Song? get currentSong => playerState.currentSong;

  void init() {
    _songs = songRepository.fetchSongs();
    notifyListeners();
  }

  void onPlayerChanged() {
    notifyListeners();
  }

  void playSong(Song song) {
    playerState.start(song);
  }

  void stopSong(Song song) {
    playerState.stop();
  }

  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }
}
