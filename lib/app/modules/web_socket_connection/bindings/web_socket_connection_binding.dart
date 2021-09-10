import 'package:get/get.dart';

import '../controllers/web_socket_connection_controller.dart';

class WebSocketConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebSocketConnectionController>(
      () => WebSocketConnectionController(),
    );
  }
}
