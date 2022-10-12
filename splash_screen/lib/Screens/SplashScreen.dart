import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, i) => Scaffold(
                backgroundColor: (i == 0)
                    ? Colors.blueGrey
                    : (i == 1)
                        ? Colors.teal
                        : Colors.red,
                body: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        (i != 2)
                            ? Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed("homePage");
                                  },
                                  child: Text(
                                    "SKIP",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              )
                            : Container(),
                        Spacer(),
                        CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage("assets/images/${i + 1}.jpg"),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              if (i == 2) {
                                Navigator.of(context).pushNamed("homePage");
                              } else {
                                pageController.animateToPage(++i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.slowMiddle);
                              }
                            },
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
