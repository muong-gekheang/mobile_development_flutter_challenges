import 'package:challenge/spotify_player_state/model/artists/artist.dart';
import 'package:flutter/widgets.dart';

class ArtistDto {
  static const String idKey = 'id';
  static const String genreKey = 'genre';
  static const String imageUrlKey = 'imageUrl';
  static const String nameKey = 'name';

  static Artist fromJson(String id, Map<String, dynamic> json) {
    assert(json[genreKey] is String);
    assert(json[imageUrlKey] is String);
    assert(json[nameKey] is String);

    return Artist(
      id: id,
      genre: json[genreKey],
      imageUrl: json[imageUrlKey],
      name: json[nameKey],
    );
  }

  Map<String, dynamic> toJson(Artist artist) {
    return {
      idKey: artist.id,
      genreKey: artist.genre,
      imageUrlKey: artist.imageUrl,
      nameKey: artist.name,
    };
  }
}
