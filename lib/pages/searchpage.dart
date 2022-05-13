import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/data/dummy_data.dart';
import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Item> resList = []; //DUMMY_DATA;
  List<Item> courseList = []; //DUMMY_DATA;

  TextEditingController searchController = new TextEditingController();
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
                decoration: InputDecoration(
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
              child: TabBar(
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(22, 0, 2, 10),
                labelColor: Color(0xFFEC407A),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.circular(28)),
                tabs: [
                  Tab(text: 'Искать курсы'),
                  Tab(text: 'Искать статьи'),
                ],
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  final tabController = DefaultTabController.of(context);
                  if (tabController == null) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  return AnimatedBuilder(
                    animation: tabController,
                    builder: (context, i) {
                      final currentTab = tabController.index;
                      if (currentTab == 0 && courseList != null) {
                        return buildTab(courseList /*, bloc*/);
                      } else {
                        return buildTab(resList /*, bloc*/);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab(List<Item> products /*, HomeBloc bloc*/) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 1,
        childAspectRatio: 4 / 4,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
            child: PresentationWidget(products[i], i),
            onTap: () {
              if (products[i].runtimeType == Article) {
                /*return bloc.inEvent.add(OnPressContentItemAction(
                      article: products[i] as Article));*/
              } else {
                /*return bloc.inEvent.add(
                      OnPressCourseItemAction(course: products[i] as Course));*/
              }
            });
      },
    );
  }
}
