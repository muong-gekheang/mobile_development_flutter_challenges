import 'dart:convert';

import 'package:challenge/spotify_player_state/model/artists/artist.dart';
import 'package:challenge/w9_firebase/data/dtos/artist_dto.dart';
import 'package:challenge/w9_firebase/data/repositories/artists/artist_repository.dart';
import 'package:http/http.dart' as http;

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistUri = Uri.https(
    'w9-database-29d15-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );
  @override
  Future<List<Artist>> fetchArtist() async {
    final http.Response response = await http.get(artistUri);
    if (response.statusCode == 200) {
      Map<String, dynamic> artistJson = jsonDecode(response.body);
      return artistJson.entries
          .map((artist) => ArtistDto.fromJson(artist.key, artist.value))
          .toList();
    } else {
      throw Exception('Failed to load artists');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) {
    // TODO: implement fetchArtistById
    throw UnimplementedError();
  }
}
