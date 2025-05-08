import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authC = Get.find<AuthController>();
    // if “id” exists, go to /screen-one; otherwise stay on “/”
    return authC.isLoggedIn
        ? const RouteSettings(name: '/screen-one')
        : super.redirect(route);
  }
}
