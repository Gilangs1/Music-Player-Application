// lib/models/song.dart

class Song {
  final String title;
  final String artist; // This is required
  final String album;  // This is required
  final String imageUrl;
  final int duration;  // Duration in seconds
  final String audioFile;

  // Constructor
  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
    required this.duration,
    required this.audioFile,
  });
}
