import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/dummy_data.dart';
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
              backgroundColor: Color(0xFFE57373),
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
                                          color: Color(0xFFE57373),
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
                                          color: Color(0xFFE57373),
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
                  padding: const EdgeInsets.fromLTRB(22, 40, 0, 0),
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
          ],
        ),
      ),
    );
  }
}
