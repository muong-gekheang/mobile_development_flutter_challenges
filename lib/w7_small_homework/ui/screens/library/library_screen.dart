import 'package:challenge/w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenge/w7_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:challenge/w7_small_homework/ui/screens/library/widget/library_content.dart';
import 'package:challenge/w7_small_homework/ui/states/player_state.dart';
import 'package:challenge/w7_small_homework/ui/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryViewModel(
        songRepository: context.read<SongRepository>(), 
        playerState: context.read<PlayerState>(),  
      ),
      child: const LibraryContent()
    );
  }
}

