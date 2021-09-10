import 'package:get/get.dart';

import '../controllers/info_edad_controller.dart';

class InfoEdadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoEdadController>(
      () => InfoEdadController(),
    );
  }
}
