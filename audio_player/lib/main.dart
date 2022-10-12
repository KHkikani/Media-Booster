import 'package:audio_player/Model/AudioSong.dart';
import 'package:audio_player/PLaylistPage.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyAudio(),
        // 'playlist': (context) => PLaylistPage(),
      },
    );
  }
}

class MyAudio extends StatefulWidget {
  const MyAudio({Key? key}) : super(key: key);

  @override
  State<MyAudio> createState() => _MyAudioState();
}

class _MyAudioState extends State<MyAudio> {
  bool isPlaying = false;

  Duration? totalDuration;

  AudioSong? currentAudio;

  @override
  initState() {
    super.initState();
    print("initState");

    allSongs.forEach((element) {
      element.assetsAudioPlayer.open(
          Audio(
            element.path,
            metas: Metas(
              title: element.songName,
              album: element.songAlbum,
            ),
          ),
          autoStart: false,
          showNotification: true, notificationSettings:
              NotificationSettings(customPlayPauseAction: (val) {
        setState(() {
          if (element.isPlaying) {
            element.assetsAudioPlayer.pause();
            element.isPlaying = false;
          } else {
            element.assetsAudioPlayer.play();
            element.isPlaying = true;
          }
        });
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
        actions: [
          IconButton(
            onPressed: () async {
              await currentAudio!.assetsAudioPlayer.pause();
              setState(() {
              currentAudio!.isPlaying = false;
              });


              showDialog(context: context, builder: (context)=>playlistDialog());


              // Navigator.of(context).pushNamed('playlist');
            },
            icon: Icon(Icons.playlist_add_check_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: allSongs
              .map((e) => Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${e.assetsAudioPlayer.getCurrentAudioTitle}",
                                  softWrap: true,
                                ),
                                Text(
                                  "${e.assetsAudioPlayer.getCurrentAudioAlbum}",
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Spacer(),
                            (e.isPlaying == false)
                                ? IconButton(
                                    onPressed: () async {
                                      if(currentAudio != null){
                                        await currentAudio!.assetsAudioPlayer
                                            .pause();
                                        setState(() {
                                          currentAudio!.isPlaying = false;
                                        });
                                      }
                                      await e.assetsAudioPlayer.play();
                                      setState(() {
                                      e.totalDuration = e.assetsAudioPlayer
                                          .current.value!.audio.duration;
                                      currentAudio = e;
                                        e.isPlaying = true;
                                      });

                                      // allSongs.forEach((element) {
                                      //   element.assetsAudioPlayer.pause();
                                      //   element.isPlaying = false;
                                      // });
                                      // await e.assetsAudioPlayer.play();
                                      // e.totalDuration = e.assetsAudioPlayer
                                      //     .current.value!.audio.duration;
                                      // setState(() {
                                      //   e.isPlaying = true;
                                      // });
                                    },
                                    icon: Icon(Icons.play_arrow),
                                  )
                                : IconButton(
                                    onPressed: () async {
                                      await e.assetsAudioPlayer.pause();
                                      setState(() {
                                        e.isPlaying = false;
                                      });
                                    },
                                    icon: Icon(Icons.pause),
                                  ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  e.isPlaying = false;
                                });
                                await e.assetsAudioPlayer.stop();
                              },
                              icon: Icon(Icons.stop),
                            ),
                            (e.inPlaylist == false)
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        e.inPlaylist = true;
                                        audiosList.add(e.assetsAudioPlayer
                                            .current.value!.audio.audio);
                                      });
                                    },
                                    icon: Icon(Icons.add),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        e.inPlaylist = false;
                                      });
                                      audiosList.remove(e.assetsAudioPlayer
                                          .current.value!.audio.audio);
                                    },
                                    icon: Icon(Icons.remove),
                                  )
                          ],
                        ),
                        StreamBuilder(
                            stream: e.assetsAudioPlayer.currentPosition,
                            builder: (context, snapShort) {
                              Duration? data = snapShort.data;
                              return (e.isPlaying == true)
                                  ? Row(
                                      children: [
                                        Slider(
                                            value: (data != null)
                                                ? data.inSeconds.toDouble()
                                                : 0,
                                            min: 0,
                                            max: (e.totalDuration != null)
                                                ? e.totalDuration!.inSeconds
                                                    .toDouble()
                                                : 0,
                                            onChanged: (val) {
                                              e.assetsAudioPlayer.seek(Duration(
                                                  seconds: val.toInt()));
                                            }),
                                        Spacer(),
                                        Text(
                                            "${data.toString().split(".")[0]} / ${(e.totalDuration != null) ? "${e.totalDuration.toString().split(".")[0]}" : "0:00:00"} "),
                                      ],
                                    )
                                  : Container();
                            }),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
