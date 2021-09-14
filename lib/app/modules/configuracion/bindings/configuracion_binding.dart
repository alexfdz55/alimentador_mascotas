import 'package:alimentador_mascote/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/configuracion_controller.dart';

class ConfiguracionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfiguracionController>(
      () => ConfiguracionController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
