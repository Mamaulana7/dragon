import '../update_profile/update_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:ukk_revisi/update_profile/update_controller.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(
      () => UpdateProfileController(),
    );
  }
}
