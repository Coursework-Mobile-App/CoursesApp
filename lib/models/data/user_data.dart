import 'package:courses_app/models/user.dart';
import 'package:courses_app/network/user_network.dart';

var user_info = UserNetwork().getUserFromDb("1");
