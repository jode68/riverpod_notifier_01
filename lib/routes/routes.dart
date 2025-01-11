import 'package:get/get.dart';
import 'package:template68/screens/home/home_page.dart';

class Routes {
  static const String homePage = '/homePage';

  static final routes = [
    GetPage(name: homePage, page: () => const HomePage()),
  ];
}
