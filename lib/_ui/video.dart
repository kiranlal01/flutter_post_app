import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget{

  // const VideoPage({Key? key,required this., required this.videoUrl}) : super(key:key);
  // final String videoUrl;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  late VideoPlayerController _controller;
  // late VideoPageController _videoPageController;
  // late Future<void> _initializeVideoPageFuture;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'https://www.example.com/sample-video.mp4', // Replace with your video URL
    // )
    _controller = VideoPlayerController.asset(
      'assets/video/samplevideo.mp4', // Replace with your video URL
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : CircularProgressIndicator(),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                Share.share('Check out this awesome website: https://example.com');
              },
              child: Text("Share"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}