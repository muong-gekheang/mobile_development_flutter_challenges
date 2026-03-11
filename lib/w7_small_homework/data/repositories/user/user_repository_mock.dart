import 'package:challenge/w7_small_homework/data/repositories/user/user.dart';
import 'package:challenge/w7_small_homework/model/songs/song.dart';

class UserRepositoryMock implements User {
  final Map<String, Song> _mockSongsById = {
    '101': Song(
      id: '101',
      title: 'Mock Song 1',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    '102': Song(
      id: '102',
      title: 'Mock Song 2',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    '104': Song(
      id: '104',
      title: 'Mock Song 4',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    '105': Song(
      id: '105',
      title: 'Mock Song 5',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
  };

  final List<Song> _historySongs = [
    Song(
      id: '104',
      title: 'Mock Song 4',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    Song(
      id: '105',
      title: 'Mock Song 5',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
  ];

  @override
  void addSongToHistory(String id) {
    final song = _mockSongsById[id];
    if (song != null) {
      _historySongs.add(song);
    }
  }

  @override
  List<Song> getUserHistorySongs() {
    return _historySongs;
  }
}
