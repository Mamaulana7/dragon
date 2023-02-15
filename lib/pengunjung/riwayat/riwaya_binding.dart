import 'package:ukk_revisi/pengunjung/riwayat/riwayat_controller.dart';
import 'package:get/instance_manager.dart';

class RiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatController>(
      () => RiwayatController(),
    );
  }
}
