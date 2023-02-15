import 'package:get/instance_manager.dart';
import 'package:ukk_revisi/pengunjung/ubah/ubah_controller.dart';

class UbahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahController>(
      () => UbahController(),
    );
  }
}
