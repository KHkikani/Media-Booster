import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List photoDetais = [];

  decodeData() async {
    String res = await rootBundle.loadString("json/photo.json");
    List details = jsonDecode(res);
    print(details);
    setState(() {
      photoDetais = details;
    });
  }

  @override
  void initState() {
    super.initState();
    decodeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: StaggeredGrid.count(
          crossAxisCount: 6,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: photoDetais
              .map((e) => StaggeredGridTile.count(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("photos_page", arguments: e);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage("${e['image']}"),
                                fit: BoxFit.cover),
                          ),
                          child: Text(
                            "${e['category']}",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                    ),
                    mainAxisCellCount: e['mainAxis'],
                    crossAxisCellCount: e['crossAxis'],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
