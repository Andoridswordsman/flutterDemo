import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoState();
  }
}

class _VideoState extends State<VideoPage> {
  VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
            "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")
        ..initialize()
        .then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("网站列表")),
      body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
