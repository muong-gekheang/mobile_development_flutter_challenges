import 'package:challenge/spotify_player_state/model/artists/artist.dart';
import 'package:challenge/spotify_player_state/model/songs/song.dart';
import 'package:challenge/w9_firebase/data/repositories/artists/artist_repository.dart';
import 'package:challenge/w9_firebase/ui/utils/async_value.dart';
import 'package:flutter/widgets.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;
  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    init();
  }

  void init() async {
    fetchArtist();
  }

  void fetchArtist() async {
    artistsValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Artist> artists = await artistRepository.fetchArtist();
      artistsValue = AsyncValue.success(artists);
    } catch (e) {
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
