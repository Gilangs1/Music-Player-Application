import '../models/song.dart';
import '../services/song_service.dart';

class DiscoverViewModel {
  final SongService _songService = SongService();
  List<Song> popularSongs = [];

  DiscoverViewModel() {
    fetchPopularSongs();
  }

  void fetchPopularSongs() {
    popularSongs = _songService.getPopularSongs();
  }
}
