import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Model/VideoModel.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key? key, required this.categorie}) : super(key: key);

  String categorie;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List videoList = [];

  initVideo() {
      print(videoList.length);
    Videos.forEach((element) {
      if (element['categories'] == widget.categorie) {
        videoList.add(ChewieController(
            videoPlayerController:
                VideoPlayerController.network("${element['url']}"),
            looping: false,
            autoPlay: false));
      }
      print(videoList.length);

      videoList.forEach((element) async {
        await element.videoPlayerController.initialize();
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    super.initState();

    initVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categorie}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: videoList
              .map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (e.videoPlayerController.value.isInitialized)
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: AspectRatio(
                              aspectRatio:
                                  e.videoPlayerController.value.aspectRatio,
                              child: Chewie(
                                controller: e,
                              ),
                            ),
                          )
                        : AspectRatio(
                            aspectRatio:
                                e.videoPlayerController.value.aspectRatio,
                            child: Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
