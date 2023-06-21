import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Media App"),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Column(
                children: [Icon(Icons.music_note_outlined), Text("Music")],
              ),
            ),
            Tab(
              child: Column(
                children: [Icon(Icons.ondemand_video_outlined), Text("video")],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Populer Song"),
                  Column(
                    children: [
                      CarouselSlider(
                        items: [
                          ...music
                              .map(
                                (e) => Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        i = music.indexOf(e);
                                        Navigator.of(context).pushNamed(
                                            'playSong',
                                            arguments: music[i]);
                                        // Navigator.of(context)
                                        //     .pushNamed('playSong');
                                      },
                                      child: Container(
                                        height: double.infinity,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(e['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        ],
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          // scrollDirection: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Indian's Best Song"),
                  Column(
                    children: [
                      CarouselSlider(
                        items: [
                          ...music
                              .map(
                                (e) => Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        i = music.indexOf(e);
                                        Navigator.of(context).pushNamed(
                                            'playSong',
                                            arguments: music[i]);
                                        // Navigator.of(context)
                                        //     .pushNamed('playSong');
                                      },
                                      child: Container(
                                        height: double.infinity,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(e['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        ],
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          // scrollDirection: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Bhajan"),
                  Column(
                    children: [
                      CarouselSlider(
                        items: [
                          ...music
                              .map(
                                (e) => Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        i = music.indexOf(e);
                                        Navigator.of(context).pushNamed(
                                            'playSong',
                                            arguments: music[i]);
                                        // Navigator.of(context)
                                        //     .pushNamed('playSong');
                                      },
                                      child: Container(
                                        height: double.infinity,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(e['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        ],
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          // scrollDirection: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...video
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            i = video.indexOf(e);
                            Navigator.of(context)
                                .pushNamed('videopage', arguments: video[i]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 2),
                                image: DecorationImage(
                                    image: AssetImage(
                                      e['img'],
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.play_circle,
                                color: Colors.blue,
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
