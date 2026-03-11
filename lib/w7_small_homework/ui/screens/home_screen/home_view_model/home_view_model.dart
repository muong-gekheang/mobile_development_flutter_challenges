import 'dart:ui';

import 'package:challenge/w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenge/w7_small_homework/data/repositories/user/user.dart';
import 'package:challenge/w7_small_homework/ui/states/player_state.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier{
  final User userRepository;
  final SongRepository songRepository;
  final PlayerState playerState;

  HomeViewModel({
    required this.userRepository,
    required this.songRepository,
    required this.playerState,
  });



}
