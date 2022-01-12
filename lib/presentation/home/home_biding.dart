import 'package:get/get.dart';
import 'package:teste_unitarios/presentation/home/home_controller.dart';

class HomeBiding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      permanent: false,
    );
  }
}
