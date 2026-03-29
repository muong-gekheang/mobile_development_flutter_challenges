import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'week10-practice-f5b79-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/songs.json',
  );

  List<Song>? _cachedSongs;

  @override
  Future<List<Song>> fetchSongs({bool forceFetch = false}) async {
    if (_cachedSongs != null && !forceFetch) {
      return _cachedSongs!;
    }

    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      _cachedSongs = result;
      return _cachedSongs!;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}

  @override
  Future<Song?> likeCounter(Song song) async {
    final int newLikeCount = song.likeCount + 1;

    final Uri uri = Uri.https(
      'week10-practice-f5b79-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/songs/${song.id}.json',
    );

    final response = await http.patch(
      uri,
      body: jsonEncode({SongDto.likeCountKey: newLikeCount}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update like count');
    }

    final updatedSong = song.copyWith(likeCount: newLikeCount);

    _cachedSongs = _cachedSongs?.map((song) {
      return song.id == updatedSong.id ? updatedSong : song;
    }).toList();

    return updatedSong;
  }
}
