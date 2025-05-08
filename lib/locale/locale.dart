import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {'title': 'الصفحة الرئيسية'},
    'en': {'title': 'Home Page, Hi @name'},
  };
}
