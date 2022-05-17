import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_podcast.dart';
import 'package:flutter/material.dart';

import '../models/podcast.dart';
import '../network_api_reccomend.dart';

class SearchPodcastPage extends StatefulWidget {
  const SearchPodcastPage({Key? key}) : super(key: key);

  @override
  State<SearchPodcastPage> createState() => _SearchPodcastPageState();
}

class _SearchPodcastPageState extends State<SearchPodcastPage> {
  TextEditingController searchController = TextEditingController();
  List<Podcast> podcasts = [];

  @override
  void initState() {
    super.initState();
    // onChanged('');
  }

  NetworkApiReccomendPodsystem rec = NetworkApiReccomendPodsystem();

  void onChanged(e) async {
    List<int> t = [];
    var ids =
        (await rec.searchPodcast(e, '[]', '1')).body.toString().split(',]')[0];
    print(ids.length);
    for (var i = 0; i < ids.length; i++) {
      String r = '';
      while (ids[i].toString() == '0' ||
          ids[i].toString() == '1' ||
          ids[i].toString() == '2' ||
          ids[i].toString() == '3' ||
          ids[i].toString() == '4' ||
          ids[i].toString() == '5' ||
          ids[i].toString() == '6' ||
          ids[i].toString() == '7' ||
          ids[i].toString() == '8' ||
          ids[i].toString() == '9') {
        r += ids[i];
        i++;
      }
      if (r != '') t.add(int.parse(r));
    }

    print(t);
    var y =
        Dependencies.instance.podcasts.where((x) => t.contains(int.parse(x.id))).toList();

    List<Podcast> o = [];

    // for (var i in t) {
    //   o.add(y[int.parse(i.toString()) - 1]);
    // }

    // for (var i in o) {
    //   print(i.toString());
    // }
    print(y);

    setState(() {
      podcasts = y;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: TextField(
                controller: searchController,
                autofocus: true,
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: 'Введите запрос',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEC407A)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                //keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 38),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  crossAxisCount: 1,
                  childAspectRatio: 4 / 4,
                ),
                itemCount: podcasts.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                      child: PresentPodcast(podcasts[i], 230, 300, i),
                      onTap: () {});
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
