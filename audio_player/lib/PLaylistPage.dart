import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player/Model/AudioSong.dart';
import 'package:flutter/material.dart';

class playlistDialog extends StatefulWidget {
  const playlistDialog({Key? key}) : super(key: key);

  @override
  State<playlistDialog> createState() => _playlistDialogState();
}

class _playlistDialogState extends State<playlistDialog> {
  AssetsAudioPlayer playlist = AssetsAudioPlayer();
  bool isPlaying = false;
  Duration? totalDuration;

  // AudioSong? currentAudio;

  @override
  void initState() {
    super.initState();
    playlist.open(
      Playlist(audios: audiosList),
      loopMode: LoopMode.playlist,
      autoStart: false,
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  void dispose() {
    super.dispose();
    playlist.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                  stream: playlist.currentPosition,
                  builder: (context, snapShort) {
                    Duration? data = snapShort.data;
                    return (isPlaying == true && totalDuration != null)
                        ? Column(
                            children: [
                              Text(
                                playlist.getCurrentAudioTitle,
                                style: textStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                playlist.getCurrentAudioAlbum,
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              Slider(
                                  value: (data != null)
                                      ? data.inSeconds.toDouble()
                                      : 0,
                                  min: 0,
                                  max: (totalDuration != null)
                                      ? totalDuration!.inSeconds.toDouble()
                                      : 0,
                                  onChanged: (val) {
                                    playlist
                                        .seek(Duration(seconds: val.toInt()));
                                  }),
                              Text(
                                  "${data.toString().split(".")[0]} / ${(totalDuration != null) ? "${totalDuration.toString().split(".")[0]}" : "0:00:00"} "),
                            ],
                          )
                        : Container();
                  }),
              Row(
                children: [
                  Expanded(
                      child: IconButton(
                    onPressed: () {
                      setState(() {
                        playlist.previous();
                        totalDuration = playlist.current.value!.audio.duration;
                      });
                    },
                    icon: Icon(Icons.skip_previous),
                  )),
                  Expanded(
                    child: (isPlaying)
                        ? IconButton(
                            onPressed: () {
                              playlist.pause();
                              setState(() {
                                isPlaying = false;
                              });
                            },
                            icon: Icon(Icons.pause),
                          )
                        : IconButton(
                            onPressed: () {
                              playlist.play();
                              setState(() {
                                totalDuration =
                                    playlist.current.value!.audio.duration;
                                isPlaying = true;
                              });
                            },
                            icon: Icon(Icons.play_arrow_rounded),
                          ),
                  ),
                  Expanded(
                      child: IconButton(
                    onPressed: () {
                      setState(() {
                        playlist.next();

                        totalDuration = playlist.current.value!.audio.duration;
                      });
                      setState(() {});
                    },
                    icon: Icon(Icons.skip_next),
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}
