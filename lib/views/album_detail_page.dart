import 'package:flutter/material.dart';
import 'play_music.dart'; // Import MusicPlayerScreen

class ArtistProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 4, 4, 4),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with Background Image and Overlay
            Stack(
              children: [
                Container(
                  height: 370,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/one.jpeg'), // Path to your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 370,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(Icons.more_vert, color: Colors.white),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Amazing One Direction",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/one.jpeg'), // Artist icon
                            radius: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Since 2011  •  One Direction",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text("Follow +"),
                  ),
                ),
              ],
            ),

            // Popular Songs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Popular Song",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSongTile(context, "Perfect", "One Direction", 'assets/perfect.jpg'),
                  buildSongTile(context, "Right Now", "One Direction", 'assets/midnight.jpeg'),
                  buildSongTile(context, "Strong", "One Direction", 'assets/strong.jpeg'),
                ],
              ),
            ),
          ],
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

  Widget buildSongTile(BuildContext context, String title, String artist, String imageUrl) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        artist,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      trailing: Icon(Icons.favorite_border, color: Colors.white),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicPlayerScreen(
              songTitle: title,
              artist: artist,
            ),
          ),
        );
      },
    );
  }
}
