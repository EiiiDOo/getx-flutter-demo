import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/counter_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CounterController>(CounterController());
  }
}
