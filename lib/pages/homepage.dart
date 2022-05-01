import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/dummy_data.dart';
import 'package:courses_app/models/mummy_data.dart';
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
  List<Article> courseList = MUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                        top: 6,
                        bottom: 6,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFEC407A),
                        radius: 36,
                        child: Image.network(
                            "https://flomaster.club/uploads/posts/2021-11/1635833030_1-flomaster-club-p-narisovannii-yeltsin-krasivii-risunok-1.png"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Добрый день, Павел!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              child: const Text.rich(
                                TextSpan(
                                  text: 'Перейти в профиль',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEC407A),
                                    //fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 24,
                      icon: Icon(Icons.search),
                      color: Color(0xFFEC407A),
                      onPressed: () {},
                      // label: const Text('Поиск'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(left: 14.0),
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFEC407A),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFEC407A),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(styleTags[index - 1],
                                      style: const TextStyle(
                                        color: Color(0xFFFFFAFA),
                                        fontSize: 14,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0, top: 20),
                child: Container(
                  child: const Text.rich(
                    TextSpan(
                      text: 'Рекомендованные статьи и курсы',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 16,
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
            SliverAppBar(
              toolbarHeight: 16,
              pinned: true,
              backgroundColor: Colors.white,
              bottom: TabBar(
                //isScrollable: true,
                padding: const EdgeInsets.fromLTRB(22, 0, 2, 0),
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
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              sliver: Builder(builder: (context) {
                final tabController = DefaultTabController.of(context);
                if (tabController == null) {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
                return AnimatedBuilder(
                  animation: tabController,
                  builder: (context, i) {
                    final currentTab = tabController.index;
                    if (currentTab == 0) {
                      return buildTab(courseList);
                    } else if (currentTab == 1) {
                      return buildTab(resList);
                    } else {
                      return buildTab(resList);
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab(List<Article> products) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return PresentationWidget(products[i]);
        },
        childCount: products.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 2,
        childAspectRatio: 4 / 4,
      ),
    );
  }
}
