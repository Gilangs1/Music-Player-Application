import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Tambahkan ini
import '../models/song.dart';
import '../services/song_service.dart';
import '../models/artist.dart';
import 'album_detail_page.dart';
import 'artist_detail_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final SongService songService = SongService();
  final AudioPlayer _audioPlayer = AudioPlayer(); // Inisialisasi AudioPlayer
  Song? _currentlyPlayingSong; // Lagu yang sedang diputar

  @override
  Widget build(BuildContext context) {
    List<Song> classicSongs = songService.getClassicSongs();
    List<Song> recentlyPlayedSongs = songService.getRecentlyPlayedSongs();
    List<Artist> popularArtists = songService.getPopularArtists();

    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 4, 4, 4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Discover",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section: Classic Song (Discover)
                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: classicSongs.map((song) => _buildSongCategoryCard(song, context)).toList(),
                  ),
                ),
                SizedBox(height: 20),

                // Section: Popular Artist
                Text(
                  "Popular Artist",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: popularArtists.map((artist) => _buildArtistCard(artist, context)).toList(),
                  ),
                ),
                SizedBox(height: 20),

                // Section: Recently Played Songs
                Text(
                  "Recently Played",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: recentlyPlayedSongs.map((song) => _buildRecentPlayCard(song)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(235, 44, 44, 44),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, // Menampilkan label untuk item yang dipilih
        showUnselectedLabels: true, // Menampilkan label untuk item yang tidak dipilih
        type: BottomNavigationBarType.fixed, // Mengatur jarak antar item agar tetap rapi
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildSongCategoryCard(Song song, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtistProfilePage()), // Corrected instantiation
        );
      },
      child: Container(
        width: 160,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(song.imageUrl, width: 160, height: 120, fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(song.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text(song.artist, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard(Artist artist, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtistDetailPage(artist: artist)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(artist.imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(artist.name, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentPlayCard(Song song) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(song.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(song.title, style: TextStyle(color: Colors.white)),
      subtitle: Text(song.artist, style: TextStyle(color: Colors.grey)),
      trailing: IconButton(
        icon: Icon(Icons.play_arrow, color: Colors.yellow),
        onPressed: () => _playSong(song), // Tambahkan pemanggilan fungsi
      ),
    );
  }

  void _playSong(Song song) async {
    if (_currentlyPlayingSong != null && _currentlyPlayingSong!.audioFile == song.audioFile) {
      // Jika lagu yang sama sedang diputar, hentikan pemutaran
      await _audioPlayer.stop();
      setState(() {
        _currentlyPlayingSong = null;
      });
    } else {
      // Hentikan lagu yang sedang diputar jika ada
      await _audioPlayer.stop();
      // Mainkan lagu baru
      int result = await _audioPlayer.play(song.audioFile, isLocal: true); // Memainkan audio dari file lokal
      if (result == 1) {
        setState(() {
          _currentlyPlayingSong = song;
        });
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Pastikan untuk menghentikan dan membuang player
    super.dispose();
  }
}
