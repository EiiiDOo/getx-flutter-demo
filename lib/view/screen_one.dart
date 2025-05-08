import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/auth_controller.dart';
import 'package:getx_flutter_demo/controller/counter_controller.dart';
import 'package:getx_flutter_demo/view/screen_two.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  final x = print(
    "<<<<<<<<<<<<<<<<<<<<<<<<<<<< MyHomePage >>>>>>>>>>>>>>>>>>>>>>>>>>>>",
  );
  final CounterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<< Build >>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('screen one'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${Get.arguments['name']}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => controller.increment(),
                      icon: Icon(Icons.add),
                    ),
                    GetBuilder<CounterController>(
                      builder: (controller) {
                        return Text(
                          '${controller.count}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () => controller.decrement(),
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    AuthController authController = Get.find();
                    authController.logOut();
                    Get.offAllNamed('/');
                  },
                  color: Colors.amber,
                  child: Text("sign out"),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              Get.to(() => ScreenTwo(), transition: Transition.rightToLeft);
              // Get.defaultDialog(
              //   title: 'Error',
              //   middleText: 'Can\'t login right now. ',
              //   titleStyle: TextStyle(
              //     color: Colors.red[900],
              //     fontWeight: FontWeight.w900,
              //   ),
              //   middleTextStyle: TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.w900,
              //   ),
              //   actions: [
              //     TextButton(
              //       onPressed: () => Get.back(),
              //       child: Text("cancel"),
              //     ),
              //   ],
              // );
            },
            child: Text("dialog"),
          ),
          MaterialButton(
            onPressed: () {
              Get.snackbar('login', 'success');
            },
            color: Colors.amber,
            child: Text("show snackbar"),
          ),
          MaterialButton(
            onPressed: () {
              if (Get.isSnackbarOpen) Get.defaultDialog();
            },
            color: Colors.amber,
            child: Text("show snackbar"),
          ),
        ],
      ),
    );
  }
}
