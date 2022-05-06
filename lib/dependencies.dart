// import 'package:redux/redux.dart';
// import 'package:shop_flutter_app/data_api/auth_dao.dart';
// import 'package:shop_flutter_app/data_api/database_dao.dart';
// import 'package:shop_flutter_app/database/cart_dao.dart';
// import 'package:shop_flutter_app/database/init_hive.dart';
// import 'package:shop_flutter_app/network/dao.dart';
// import 'package:shop_flutter_app/redux/state.dart';
// import 'package:shop_flutter_app/redux/store.dart';
// import 'package:shop_flutter_app/screens/navigator.dart';

// import 'data_api/network_dao.dart';
// import 'database/auth_dao.dart';

import 'package:courses_app/models/user.dart';
import 'package:courses_app/network/article_network.dart';
import 'package:courses_app/network/course_network.dart';
import 'package:courses_app/network/podcast_network.dart';
import 'package:courses_app/network/user_network.dart';
import 'package:firebase_core/firebase_core.dart';

import 'navigator_panel/navigator.dart';

class Dependencies {
  // final ProductApiDao productsApi;
  // late final Store<GlobalState> store = MyStoreBuilder.build();
  final AppNavigator navigator;
  User actualUser;
  final PodcastNetwork podcastNetwork;
  final ArticleNetwork articleNetwork;
  final CourseNetwork courseNetwork;
  // final CartProductDao cartProductDao;
  // final AuthDao authDao;

  static late Dependencies _instance;
  Dependencies._(
    this.navigator,
    this.actualUser,
    this.articleNetwork,
    this.podcastNetwork,
    this.courseNetwork,
    // , this.productsApi, this.cartProductDao, this.authDao
  );

  static Future<Dependencies> init() async {
    // final hiveBuilder = await HiveBuilder.build();
    // final cartProductDao = DatabaseApi(database: hiveBuilder.cartBox);
    // final authDao = AuthDaoApi(database: hiveBuilder.userBox);

    // ref = await FirebaseStorage.instance
    //     .ref()
    //     .child('IMG_0773.PNG')
    //     .getDownloadURL();
    return _instance = Dependencies._(
      AppNavigator(),
      await UserNetwork().getUserFromDb("1"),
      ArticleNetwork(),
      PodcastNetwork(),
      CourseNetwork(),
      // NetworkApi(),
      // cartProductDao,
      // authDao,
    );
  }

  // void initUser(String id) async {
  //   actualUser =
  // }

  static Dependencies get instance => _instance;
}
