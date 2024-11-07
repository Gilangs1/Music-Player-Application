import 'song.dart';

class Playlist {
  final String name;
  final String imageUrl;
  final List<Song> songs;

  Playlist({
    required this.name,
    required this.imageUrl,
    required this.songs,
  });
}
