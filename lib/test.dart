import 'package:flutter/material.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:video_player/video_player.dart';

import 'ApiCall/Category_api.dart';
import 'ApiCall/Post_api.dart';

class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.srt');
    return SubRipCaptionFile(fileContents);
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'http://www.streambox.fr/playlists/test_001/stream.m3u8',
      closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

      ),
    );
  }
}
