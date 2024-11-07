// lib/services/song_service.dart

import '../models/song.dart';
import '../models/artist.dart';

class SongService {
  // Data untuk lagu-lagu populer
  List<Song> getPopularSongs() {
    return [
      Song(
        title: "Story of My Life",
        artist: "One Direction",
        album: "Midnight Memories",
        imageUrl: "assets/images/album_cover.jpg",
        duration: 180,
        audioFile: "assets/music/Midnight_Memories.mp3",
      ),
      Song(
        title: "Perfect",
        artist: "One Direction",
        album: "Made in the A.M.",
        imageUrl: "assets/one.jpeg",
        duration: 200,
        audioFile: "assets/music/Hey_Angel.mp3",
      ),
    ];
  }

  // Data untuk lagu klasik dengan properti yang diperlukan
  List<Song> getClassicSongs() {
    return [
      Song(
        title: "Iwan Fals, Rhoma Irama, Dewa-19, Adella",
        artist: "Various Artists", // Providing a default artist
        album: "Classic Hits",      // Providing a default album
        imageUrl: "assets/classic.jpg",
        duration: 0,                // Duration can be zero if unknown
        audioFile: "assets/audio/default.mp3", // Provide a default audio file if needed
      ),
      Song(
        title: "One Direction, Zayn Malik (Solo)",
        artist: "Various Artists", // Providing a default artist
        album: "Classic Hits",      // Providing a default album
        imageUrl: "assets/zayn.jpg",
        duration: 0,
        audioFile: "assets/audio/default.mp3",
      ),
      Song(
        title: "Bruno M Virgoun,",
        artist: "Various Artists",         // Providing a default artist
        album: "Classic Hip-Hop",  // Providing a default album
        imageUrl: "assets/chill.jpg",
        duration: 0,
        audioFile: "assets/audio/default.mp3",
      ),
    ];
  }

  // Data untuk lagu yang baru diputar
  List<Song> getRecentlyPlayedSongs() {
    return [
      Song(
        title: "Dumes",
        artist: "Guyon Waton",
        album: "Single",
        imageUrl: "assets/guyon.jpg",
        duration: 210,
        audioFile: "assets/music/DUMES.mp3",
      ),
      Song(
        title: "Thinking Out Loud",
        artist: "Ed Sheeran",
        album: "x",
        imageUrl: "assets/ed.jpg",
        duration: 280,
        audioFile: "assets/music/EdSheeran.mp3",
      ),
    ];
  }

  // Data untuk artis populer
  List<Artist> getPopularArtists() {
    return [
      Artist(name: "Coldplay", imageUrl: "assets/cold.jpg", yearActive: 1999),
      Artist(name: "The 1970", imageUrl: "assets/1970.jpg", yearActive: 1992),
      Artist(name: "Black Pink", imageUrl: "assets/blackpink.jpg", yearActive: 2010),
    ];
  }
}
