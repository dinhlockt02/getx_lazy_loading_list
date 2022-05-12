import 'package:get/route_manager.dart';
import 'package:getx_infinitive_list/app/binding/home_binding.dart';
import 'package:getx_infinitive_list/app/screen/home_screen.dart';

import 'app_routes.dart';

abstract class AppScreen {
  static final page = [
    GetPage(
        name: Routes.INITIAL, page: () => HomeScreen(), binding: HomeBinding()),
  ];
}
