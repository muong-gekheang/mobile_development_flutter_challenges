class Song {
  final String id;
  final String title;
  final String artistId;
  final Duration duration;
  final Uri imageUrl;
  final int likeCount;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.imageUrl,
    this.likeCount = 0,
  });

  Song copyWith({int? likeCount}) {
    return Song(
      id: id,
      title: title,
      artistId: artistId,
      duration: duration,
      imageUrl: imageUrl,
      likeCount: likeCount ?? this.likeCount,
    );
  }

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist id: $artistId, duration: $duration)';
  }
}
