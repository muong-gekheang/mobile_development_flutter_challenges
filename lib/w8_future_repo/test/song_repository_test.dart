import 'package:challenge/w8_future_repo/data/repositories/songs/song_repository_mock.dart';

void main() async {
  //   Instantiate the  song_repository_mock

  // Test both the success and the failure of the post request

  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // - Using async/await with try/catch.

  final SongRepositoryMock songRepository = SongRepositoryMock();

  print('then catch method');
  songRepository
      .fetchSongById('25')
      .then((song) {
        print('Sound found: ${song?.title}');
      })
      .catchError((error) {
        print('Error: ${error}');
      });

  print('Try catch method');
  try {
    final song = await songRepository.fetchSongById('s3');
    print('song found: ${song?.title}');
  } catch (error) {
    print('Error: ${error}');
  }
}
