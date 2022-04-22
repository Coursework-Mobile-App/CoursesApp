import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/dummy_data.dart';
import 'package:courses_app/models/preaentation_widget.dart';
import 'package:flutter/material.dart';

final styleTags = [
  'Курсы',
  'Математика',
  'Пение',
  'Алкоголь',
  'Караоке',
  'Метро',
  'Буратино',
  'Дельфины',
  'Пионеры',
  'Подкасты',
  'Статьи'
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> resList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        /*drawer: Drawer(),
      appBar: CustomAppBar(
        height: 150,
      ),*/
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              shadowColor: Colors.black,
              //foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              backgroundColor: Color(0xFFEC407A),
              floating: false,
              expandedHeight: 20.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Coursach',
                  style: TextStyle(color: Color(0xFFF2F4F3)),
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
                          height: 67.0,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: styleTags.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Material(
                                    child: InkWell(
                                      //onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEC407A),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Icon(
                                              Icons.home,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Material(
                                    child: InkWell(
                                      //onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEC407A),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(styleTags[index - 1],
                                                style: const TextStyle(
                                                  color: Color(0xFFFFFAFA),
                                                  fontSize: 17,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                  child: Container(
                    child: const Text.rich(
                      TextSpan(
                        text: 'Рекомендованные статьи и курсы',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 180,
                          //padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: DUMMY_DATA.length,
                              itemBuilder: (context, index) {
                                return PresentationWidget(resList[index]);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              DefaultTabController(
                  length: 3,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Container(
                            //height: 50,
                            width: 50,
                            color: Colors.transparent,
                          ),
                          Container(
                              color: Colors.white38,
                              child: TabBar(
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                indicator: BoxDecoration(
                                    color: Color(0xFFEC407A),
                                    borderRadius: BorderRadius.circular(18)),
                                tabs: [
                                  Tab(text: 'Курсы'),
                                  Tab(text: 'Статьи'),
                                  Tab(text: 'Микс')
                                ],
                              ))
                        ],
                      )))
            ]))
            /*SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              delegate: SliverChildBuilderDelegate(
                (context, int index1) {
                  var el = PresentationWidget(resList[index1]);
                  return el;
                },
                childCount: resList.length,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
