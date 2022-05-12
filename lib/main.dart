import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/pages_routes/app_screens.dart';
import 'app/screen/home_screen.dart';

import 'app/pages_routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.INITIAL,
    getPages: AppScreen.page,
  ));
}
