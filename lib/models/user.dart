import 'song.dart';

class User {
  final String username;
  final List<Song> favoriteSongs;

  User({
    required this.username,
    this.favoriteSongs = const [],
  });

  // Method untuk menambah lagu ke daftar favorit
  void addFavoriteSong(Song song) {
    favoriteSongs.add(song);
  }

  // Method untuk menghapus lagu dari daftar favorit
  void removeFavoriteSong(Song song) {
    favoriteSongs.remove(song);
  }
}
