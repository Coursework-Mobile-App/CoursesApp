import 'package:courses_app/bloc_architecture/bloc_podcast/podcast_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_podcast/podcast_events.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/data/dummy_data.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:courses_app/models/widgets/present_podcast.dart';
import 'package:courses_app/models/data/pummy_data.dart';
import 'package:flutter/material.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({Key? key}) : super(key: key);

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  List<Article> resList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    PodcastBloc bloc = PodcastBloc();
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
              onPressed: () => null,
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
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
                          itemCount: DUMMY_DATA.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                child:
                                    PresentPodcast(PUMMY_DATA[index], 230, 300),
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
                  text: 'Плейлисты с выпусками',
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
                          itemCount: DUMMY_DATA.length,
                          itemBuilder: (context, index) {
                            return PresentPodcast(PUMMY_DATA[index], 130, 200);
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
                  text: 'Категории',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return PresentPodcast(PUMMY_DATA[i], 170, 170);
            },
            childCount: PUMMY_DATA.length,
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
