import 'package:get/get.dart';

import '../controllers/intro_controller.dart';

class IntroPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(),
    );
  }
}
