import 'package:challenge/w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenge/w7_small_homework/data/repositories/user_history/user_history_repository.dart';
import 'package:challenge/w7_small_homework/ui/states/player_state.dart';

class HomeViewModel {
  final UserHistoryRepository userHistoryRepository;
  final SongRepository songRepository;
  final PlayerState playerState;

  HomeViewModel({
    required this.userHistoryRepository,
    required this.songRepository,
    required this.playerState,
  });
}
