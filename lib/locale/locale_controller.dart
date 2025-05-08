import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
  void changeLang(String code) {
    Locale locale = Locale(code);
    Get.updateLocale(locale);
  }
}
