import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shimmer/shimmer.dart';

import '../dependencies.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  //List videoInfo = [];
  bool playArea = false;
  bool isPlaying = false;
  //Duration _duration = Duration.zero;
  //Duration _position = Duration.zero;
  bool _disposed = false;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    //await DefaultAssetBundle.of(context).loadString(key)
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFFEC407A),
          Color(0xFFF8BBD0),
        ],
        begin: const FractionalOffset(0.0, 0.4),
        end: Alignment.topRight,
      )),
      child: Column(
        children: [
          playArea == true
              ? Container(
                  child: Column(
                  children: [
                    Container(
                      height: 100,
                      padding:
                          const EdgeInsets.only(top: 50, left: 30, right: 30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.favorite_outline,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    playView(context),
                    controlView(context),
                  ],
                ))
              : Container(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Dependencies.instance.navigator.pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.favorite_outline,
                            size: 20,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.course.title,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.course.author,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.white30],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color: Colors.brown,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "74 мин.",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 220,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [Colors.white70, Colors.white30],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.handyman_outlined,
                                  size: 20,
                                  color: Colors.brown,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Отношения, общество",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        parseText(widget.course.text),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "5 lessons",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          itemCount: widget.course.lessons.length,
                          itemBuilder: (_, int index) {
                            return GestureDetector(
                              onTap: () {
                                print('corr');
                                setState(() {
                                  if (!playArea) {
                                    playArea = true;
                                  }
                                  onTapVideo(index);
                                });
                              },
                              child: Container(
                                height: 135,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        widget
                                                            .course
                                                            .lessons[index]
                                                            .coverImage),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              parseText(widget
                                                  .course.lessons[index].title),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3),
                                              child: Text(
                                                parseText(widget.course
                                                    .lessons[index].texts[0]),
                                                style: TextStyle(
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF8BBD0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'lesson ' +
                                                  (index + 1).toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            for (int i = 0; i < 40; ++i)
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3),
                                                child: Container(
                                                  width: 3,
                                                  height: 2,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF8BBD0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                ),
                                              )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  onTapVideo(int index) {
    final controller = VideoPlayerController.network(
        'https://rr16---sn-n8v7kn7y.googlevideo.com/videoplayback?expire=1652754024&ei=CLKCYrXGM5foyQWuloqoCQ&ip=89.175.18.189&id=o-AHAtMoWINxi8eq7dJDbrrANvbVAa4oFwjt7d0iCYLx2v&itag=22&source=youtube&requiressl=yes&mh=2v&mm=31%2C29&mn=sn-n8v7kn7y%2Csn-jvhnu5g-n8ve7&ms=au%2Crdu&mv=m&mvi=16&pl=19&initcwndbps=543750&spc=4ocVC6ke1McgP7ehm5iyQnXiBUcydIRVY7XCpsWj6w&vprv=1&mime=video%2Fmp4&ns=AV0NVl1_L9j23XTc0xZ6508G&cnr=14&ratebypass=yes&dur=398.152&lmt=1603738645789429&mt=1652731984&fvip=4&fexp=24001373%2C24007246&c=WEB&txp=5432432&n=YCQI8PfN4npFng&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgeyhT3FkVanz-RNlJESFtq0Ij4PyIZTd6ejCxOUcqMoUCIHBLZCpWokpWoV5AmkU0fKS_sMP2BtInu-AmB1-cH_1Z&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgUkFrYyK1zuOrjGQqgxqK18gVBe-r8JaZ7p0u7NXyb3sCIEZF-CRKnVJLrY18oh2xbp12f9Boo-yAv33BdogJGpuu');
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(onControllUpdate);
      old.pause();
    }
    setState(() {
      controller
        ..initialize().then((_) {
          old?.dispose();
          //controller.addListener(onControllerUpdate);
          controller.addListener(onControllUpdate);
          controller.play();
          setState(() {});
        });
    });
  }

  Widget playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.pink[300]!,
              highlightColor: Colors.pink[100]!,
              child: Container(
                //color: Colors.white, height: 180, width: 170),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      //color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text("Снимаем видео..."),
            ),
          ],
        ),
      );
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration = Duration(minutes: 6, seconds: 38);
  Duration? _position = Duration.zero;
  var _progress = 0.0;
  void onControllUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 100;

    final controller = _controller;
    if (controller == null) {
      debugPrint('controller is null');
      return;
    }

    if (!controller.value.isInitialized) {
      debugPrint('controller cannot be initialized');
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }

    var duration = _duration;
    if (duration == null) {
      return;
    }
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
      isPlaying = playing;
    }
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget controlView(BuildContext context) {
    final duration = _duration?.inSeconds;
    final head = _position?.inSeconds;
    final remainded = max(0, duration! - head!);
    final mins = convertTwo(remainded ~/ 60.0);
    final secs = convertTwo(remainded % 60);
    return Column(
      children: [
        Slider(
          activeColor: Colors.black,
          thumbColor: Colors.black,
          inactiveColor: Colors.grey,
          value: max(0, min(_progress * 100, 100)),
          min: 0,
          max: 100,
          divisions: 100,
          label: _position.toString().split('.')[0],
          onChanged: (value) {
            setState(() {
              _progress = value * 0.01;
            });
          },
          onChangeStart: (value) {
            _controller?.pause();
          },
          onChangeEnd: (value) {
            final duration = _controller?.value.duration;
            if (duration != null) {
              var newValue = max(0, min(value, 99)) * 0.01;
              var millis = (duration.inMicroseconds * newValue).toInt();
              _controller?.seekTo(Duration(milliseconds: millis));
              _controller?.play();
            }
          },
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () async {},
                child: Icon(
                  Icons.fast_rewind_outlined,
                  size: 31,
                  color: Colors.black,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  if (isPlaying) {
                    setState(() {
                      isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  isPlaying ? Icons.pause_outlined : Icons.play_arrow_outlined,
                  size: 31,
                  color: Colors.black,
                ),
              ),
              FlatButton(
                onPressed: () async {},
                child: Icon(
                  Icons.fast_forward_outlined,
                  size: 31,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String parseText(String text) {
    return text.replaceAll('#', '\n');
  }
}
