import 'package:challenge/w7_small_homework/model/songs/song.dart';

abstract class User {
  List<Song> getUserHistorySongs();
  void addSongToHistory(String id);
}
