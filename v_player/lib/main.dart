import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:v_player/Model/VideoModel.dart';
import 'package:v_player/VideoPage.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: Categories.categoriesList
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        print(e);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                VideoPage(categorie: "${e['name']}")));
                      },
                      child: Stack(
                        children: [
                          Image.network(
                            "${e['photo']}",
                          ),
                          Align(
                              alignment: Alignment(-0.9, 1),
                              child: Text(
                                "${e['name']}",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                    color: Colors.teal,
                                    letterSpacing: 3),
                              )),
                        ],
                      ),
                    ),
                  ))
              .toList(),

          // children: allVideos
          //     .map(
          //       (e) => Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           (e.chewieController.videoPlayerController.value
          //                   .isInitialized)
          //               ? AspectRatio(
          //                   aspectRatio: e.chewieController
          //                       .videoPlayerController.value.aspectRatio,
          //                   child: Chewie(
          //                     controller: e.chewieController,
          //                   ),
          //                 )
          //               : AspectRatio(
          //                   aspectRatio: e.chewieController
          //                       .videoPlayerController.value.aspectRatio,
          //                   child: Container(
          //                     alignment: Alignment.center,
          //                     child: CircularProgressIndicator(),
          //                   ),
          //                 ),
          //           Padding(
          //             padding: EdgeInsets.only(top: 5, bottom: 20, left: 5),
          //             child: Row(
          //               children: [
          //                 CircleAvatar(
          //                   radius: 25,
          //                   backgroundImage: AssetImage("assets/images/1.jpg"),
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         "${e.chewieController.videoPlayerController.httpHeaders['Name']}",
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 16),
          //                       ),
          //                       Text(
          //                         "${e.chewieController.videoPlayerController.httpHeaders['Desc']}",
          //                         maxLines: 2,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //     .toList(),
        ),
      ),
    );
  }
}
