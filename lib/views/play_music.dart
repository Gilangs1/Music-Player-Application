import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  final String songTitle;
  final String artist;

  MusicPlayerScreen({required this.songTitle, required this.artist});

  void navigateToLyrics(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _LyricsScreen()),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 4, 4, 4),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(159, 39, 35, 35),
        title: Text("Favorite", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () => showSnackbar(context, "More options"),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => navigateToLyrics(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],  // Background warna abu-abu
                  borderRadius: BorderRadius.circular(8), // Sudut membulat
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info_outline, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Swipe right to reveal the song lyrics, and do it again to return to position a.",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/one.jpeg',
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            songTitle,
            style: TextStyle(color: const Color.fromARGB(255, 255, 253, 253), fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            artist,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          
          // Menambahkan Spacer untuk mendorong slider lebih ke bawah
          Spacer(),  // Memastikan slider dan durasi pindah lebih bawah
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Slider(
                  value: 1.56,
                  min: 0,
                  max: 3.0,
                  onChanged: (value) {},
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1:58", style: TextStyle(color: Colors.grey)),
                    Text("3:00", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          
          // Kontainer kontrol musik tetap di bawah
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 40),  // Padding atas ditambahkan
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20), // Border added here  // Adding border to all sides
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,  // Keep elements at the bottom
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.white, size: 30),
                        onPressed: () => showSnackbar(context, "Add to favorites"),
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_previous, color: Colors.white, size: 40),
                        onPressed: () => showSnackbar(context, "Previous song"),
                      ),
                      IconButton(
                        icon: Icon(Icons.play_circle_fill, color: Colors.yellow, size: 60),
                        onPressed: () => showSnackbar(context, "Play song"),
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next, color: Colors.white, size: 40),
                        onPressed: () => showSnackbar(context, "Next song"),
                      ),
                      IconButton(
                        icon: Icon(Icons.repeat, color: Colors.white, size: 30),
                        onPressed: () => showSnackbar(context, "Repeat song"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.white),
                        onPressed: () => showSnackbar(context, "Share song"),
                      ),
                      SizedBox(width: 390),
                      IconButton(
                        icon: Icon(Icons.download, color: Colors.white),
                        onPressed: () => showSnackbar(context, "Download song"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LyricsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lyrics"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Here are the lyrics for the song...",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
