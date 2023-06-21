import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class playSong extends StatefulWidget {
  const playSong({super.key});

  @override
  State<playSong> createState() => _playSongState();
}

class _playSongState extends State<playSong> {
  Duration? duration;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  void playaudio() {
    assetsAudioPlayer.open(Audio(music[i]['path']));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playaudio();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Play Song"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(music[i]['img']),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Songs",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: assetsAudioPlayer.currentPosition,
                builder: (context, AsyncSnapshot snapshot) {
                  Duration? data = snapshot.data as Duration?;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Slider(
                        activeColor: Colors.green.shade300,
                        thumbColor: Colors.green,
                        inactiveColor: Colors.grey,
                        min: 0,
                        max: (assetsAudioPlayer.current.hasValue)
                            ? assetsAudioPlayer
                                .current.value!.audio.duration.inSeconds
                                .toDouble()
                            : 0,
                        value: data!.inSeconds.toDouble(),
                        onChanged: (val) {
                          assetsAudioPlayer
                              .seek(Duration(seconds: val.toInt()));
                        },
                      ),
                      Text("${data.toString().split(".")[0]}")
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    assetsAudioPlayer.play();
                  },
                  child: Text("Play"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    assetsAudioPlayer.pause();
                  },
                  child: Text("Pause"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    assetsAudioPlayer.stop();
                  },
                  child: Text("Resent"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.makeagif.com/media/10-18-2015/iG8MRA.gif"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
