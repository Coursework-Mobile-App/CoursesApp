import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/models/article.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final article = widget.article;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.article.coverImage,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              pinned: false,
              snap: false,
              floating: false,
              stretch: true,
              expandedHeight: 350.0,
              flexibleSpace: Stack(children: [
                Positioned(
                  child: InkWell(
                    /*onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          FullsreenImageView(link: widget.art.primaryImage),
                    ),
                  );
                },*/
                    child: FlexibleSpaceBar(
                      stretchModes: <StretchMode>[
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                      ],
                      titlePadding: EdgeInsetsDirectional.only(
                          start: 30, end: 10, bottom: 40),
                      centerTitle: false,
                      title: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              spreadRadius: 70,
                              blurRadius: 120,
                              offset:
                                  Offset(10, 50), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: widget.article.title,
                            children: [
                              TextSpan(
                                text: '\n' + widget.article.author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      background: DecoratedBox(
                          position: DecorationPosition.foreground,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      widget.article.coverImage),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    //height: 700.0,
                    //alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            /*Text.rich(TextSpan(
                      text: 'Overview',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 25,
                      ),
                    )),*/
                            /*Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconToggleButton(
                            isSelected: isSelected,
                            onPressed: () {
                              setState(
                                () {
                                  isSelected = !isSelected;
                                },
                              );
                            },
                            art: art,
                          ),
                        ),
                      ),
                    )*/
                          ]),

                          // ------
                          //SizedBox(height: 30),
                          Text.rich(TextSpan(
                            text: 'Год',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          )),
                          SizedBox(height: 3),
                          Text.rich(TextSpan(
                            text: '2021',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          )),

                          // ------
                          SizedBox(height: 30),
                          Text.rich(TextSpan(
                            text: 'Об авторе',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          )),
                          SizedBox(height: 3),
                          Text.rich(TextSpan(
                            text: 'Эксперт во всех вопросах',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          )),
                          SizedBox(height: 30),
                          Text.rich(TextSpan(
                            text: 'Время чтения',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          )),

                          SizedBox(height: 3),
                          Text.rich(TextSpan(
                            text: '2 минуты',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          )),

                          SizedBox(height: 40),
                          Text.rich(TextSpan(
                            text: 'Первые более или менее достоверные доказательства существования породы относятся к XVI–XVII столетиям. Белые собаки с небольшими темными отметинами изображены на сохранившихся религиозных и светских произведениях искусства тех времен: росписи алтаря в церкви Святой Марии (также известной как «Gospe od anđela») в небольшом городе на курортном острове Лошинь, фреске в монастыре францисканцев в Заостроге, фресках церкви Санта-Мария Новелла во Флоренции, парадных портретах кисти венецианских и тосканских художников, где изображены влиятельные вельможи – например, Козимо II Медичи. Поскольку многие самые ранние свидетельства обнаружены на территории исторической области Далмация, которая ныне является частью Хорватии, именно отсюда принято выводить корни брида. Да и очевидное созвучие названий говорит в пользу этой версии, официально принятой FCI.' +
                                '\n\nТам же, на теплых берегах Адриатического моря, увидели свет и некоторые «теоретические» работы. Римско-католическая Джяково-Осиековская архиепархия сохранила в своих архивах хроники епископа Петара Бакича (1719 год) и Андреаса Кечкеметы (1739 год), оба говорят о специфичных для Хорватии собаках Canis Dalmaticus. В 1771 году натуралист из Уэльса Томас Пеннант написал книгу «Синопсис четвероногих», где впервые назвал породу Dalmatian. В 1790 году английский исследователь естественной истории Томас Бьюик включил далматинцев в «Общую историю четвероногих».',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          )),

                          SizedBox(height: 60),
                          //------
                          // SizedBox(height: 30),
                          // Text.rich(TextSpan(
                          //   text: 'Similar',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.black87,
                          //     fontSize: 25,
                          //   ),
                          // )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
