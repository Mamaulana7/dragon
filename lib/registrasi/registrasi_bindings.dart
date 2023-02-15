import 'package:get/instance_manager.dart';
import 'package:ukk_revisi/registrasi/registrasi_controler.dart';
import 'package:get/instance_manager.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(),
    );
  }
}
