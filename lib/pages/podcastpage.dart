import 'package:courses_app/bloc_architecture/bloc_podcast/podcast_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_podcast/podcast_events.dart';
import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/widgets/present_podcast.dart';
import 'package:flutter/material.dart';

import '../models/podcast.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({Key? key}) : super(key: key);

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  List<Podcast> resList = Dependencies.instance.podcasts;

  @override
  Widget build(BuildContext context) {
    PodcastBloc bloc = PodcastBloc();
    List<Podcast> relaxList = new List.from(resList.reversed);
    List<Podcast> aloneList =
        new List.from([resList[1], resList[4], resList[10], resList[14]]);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          shadowColor: Colors.black,
          //foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),
          backgroundColor: Colors.white,
          floating: false,
          expandedHeight: 20.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              'Подкасты',
              style: TextStyle(color: Color(0xFFEC407A)),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Color(0xFFEC407A),
              onPressed: () {
                return bloc.inEvent.add(OnClickSearchPodcastAction());
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Актуальное',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 330,
                      //padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: resList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                child: PresentPodcast(
                                    resList[index], 230, 300, index + 200),
                                onTap: () => {
                                      bloc.inEvent.add(OnClickPodcastAction()),
                                    });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            child: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Слушаем и отдыхаем',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 200,
                      //padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: relaxList.length,
                          itemBuilder: (context, index) {
                            return PresentPodcast(
                                relaxList[index], 130, 200, index);
                            //return GestureDetector(
                            //child: PresentPodcast(
                            //     PUMMY_DATA[index], 130, 200, index + 100),
                            //  onTap: () => {
                            //     bloc.inEvent.add(OnClickPodcastAction()),
                            //    });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Наедине с мыслями',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return PresentPodcast(aloneList[i], 170, 170, i + 100);
              /* return GestureDetector(
                                child: PresentPodcast(
                                    PUMMY_DATA[index], 130, 200, index + 100),
                                onTap: () => {
                                      bloc.inEvent.add(OnClickPodcastAction()),
                                    });*/
            },
            childCount: aloneList.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.45,
          ),
        ),
      ],
    );
  }
}
