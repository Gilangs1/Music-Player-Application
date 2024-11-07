import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool _isPlaying = false;
  Duration _currentPosition = Duration(seconds: 116);
  Duration _totalDuration = Duration(minutes: 3);

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '🔁 Swipe right to reveal the song lyrics, and do it again to return to position a.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Image.network(
              'https://example.com/album_cover.jpg', // Ganti dengan URL gambar album yang sesuai
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Story of My Life',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'One Direction',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Slider(
                min: 0,
                max: _totalDuration.inSeconds.toDouble(),
                value: _currentPosition.inSeconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _currentPosition = Duration(seconds: value.toInt());
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(_currentPosition)),
                  Text(_formatDuration(_totalDuration)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause_circle : Icons.play_circle),
                onPressed: _togglePlayPause,
                iconSize: 64,
                color: Colors.yellow,
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
