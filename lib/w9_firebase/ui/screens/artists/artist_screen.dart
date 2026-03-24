import 'package:challenge/w9_firebase/data/repositories/artists/artist_repository.dart';
import 'package:challenge/w9_firebase/ui/screens/artists/view_model/artist_view_model.dart';
import 'package:challenge/w9_firebase/ui/screens/artists/widgets/artist_content.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArtistViewModel(
        artistRepository: context.read<ArtistRepository>(),
        ),
        child: const ArtistContent(),
      );
  }
}