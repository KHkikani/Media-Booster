import 'package:assets_audio_player/assets_audio_player.dart';

class AudioSong {
  bool isPlaying;
  bool inPlaylist;
  String path;
  String songName;
  String songAlbum;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration? totalDuration;

  AudioSong(
      {required this.path,
      required this.inPlaylist,
      required this.songName,
      required this.songAlbum,
      required this.assetsAudioPlayer,
      required this.isPlaying,
      required this.totalDuration});
}

List<AudioSong> allSongs = [
  AudioSong(
    songName: "The Hic Song",
    songAlbum: "Goodbye",
    path: "assets/audios/The Hic Song - Goodbye.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    totalDuration: null,
    inPlaylist: false,
  ),
  AudioSong(
    songName: "Alcoholia",
    songAlbum: "Vikram Vedha",
    path: "assets/audios/Alcoholia - Vikram Vedha.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    totalDuration: null,
    inPlaylist: false,
  ),
  AudioSong(
    songName: "Bande",
    songAlbum: "Vikram Vedha",
    path: "assets/audios/Bande - Vikram Vedha.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    totalDuration: null,
    inPlaylist: false,
  ),
  AudioSong(
    songName: "Dance Ka Bhoot",
    songAlbum: "Brahmastra",
    path: "assets/audios/Dance Ka Bhoot - Brahmastra.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    totalDuration: null,
    inPlaylist: false,
  ),
  AudioSong(
    songName: "Haaniya Ve",
    songAlbum: "Jubin Nautiyal",
    path: "assets/audios/Haaniya Ve - Jubin Nautiyal.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    totalDuration: null,
    inPlaylist: false,
  ),
  AudioSong(
    songName: "Ishq Da Dariyaa",
    songAlbum: "Stebin Ben",
    path: "assets/audios/Ishq Da Dariyaa - Stebin Ben.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    inPlaylist: false,
    totalDuration: null,
  ),
  AudioSong(
    songName: "Ki Meri Saanson Mein Tu",
    songAlbum: "",
    path: "assets/audios/Ki Meri Saanson Mein Tu.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    inPlaylist: false,
    totalDuration: null,
  ),
  AudioSong(
    songName: "Manike",
    songAlbum: "Thank God",
    path: "assets/audios/Manike - Thank God.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    inPlaylist: false,
    totalDuration: null,
  ),
  AudioSong(
    songName: "Naach Baby",
    songAlbum: "Bhoomi Trivedi",
    path: "assets/audios/Naach Baby - Bhoomi Trivedi.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    inPlaylist: false,
    totalDuration: null,
  ),
  AudioSong(
    songName: "Rula Ke Gaya Ishq",
    songAlbum: "Stebin Ben",
    path: "assets/audios/Rula Ke Gaya Ishq - Stebin Ben.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    inPlaylist: false,
    totalDuration: null,
  ),
  AudioSong(
    songName: "Sun Le Saathiya",
    songAlbum: "Stebin Ben",
    path: "assets/audios/Sun Le Saathiya - Stebin Ben.mp3",
    assetsAudioPlayer: AssetsAudioPlayer(),
    isPlaying: false,
    inPlaylist: false,
    totalDuration: null,
  ),
];

List<Audio> audiosList = [];
