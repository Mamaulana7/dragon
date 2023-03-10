import 'package:get/get.dart';
import 'package:ukk_revisi/admin/admin.dart';
import 'package:ukk_revisi/admin/permintaan/permintaan.dart';
import 'package:ukk_revisi/admin/permintaan/admin_binding.dart';
import 'package:ukk_revisi/change_password/change.dart';
import 'package:ukk_revisi/change_password/change_bindings.dart';
import 'package:ukk_revisi/login/login_bindings.dart';
import 'package:ukk_revisi/menu.dart';
import 'package:ukk_revisi/pengunjung/riwayat/riwaya_binding.dart';
import 'package:ukk_revisi/pengunjung/riwayat/riwayat.dart';
import 'package:ukk_revisi/pengunjung/ubah/ubah.dart';
import 'package:ukk_revisi/pengunjung/ubah/ubah_binding.dart';
import 'package:ukk_revisi/registrasi/register.dart';
import 'package:ukk_revisi/registrasi/registrasi_bindings.dart';
import 'package:ukk_revisi/update_profile/update.dart';
import 'package:ukk_revisi/update_profile/update_bindings.dart';
import '../login/login.dart';
import 'package:ukk_revisi/pengunjung/data/binding.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.MENU,
      page: () => MenuPage(),
      transition: Transition.fadeIn,
      binding: Barubinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminPage(),
      transition: Transition.fadeIn,
      binding: PermintaanBinding(),
    ),
    GetPage(
      name: _Paths.PERMINTAAN,
      page: () => PermintaanPage(),
      binding: PermintaanBinding(),
    ),

    GetPage(
      name: _Paths.RIWAYAT,
      page: () => RiwayatPage(),
      binding: RiwayatBinding(),
    ),
    GetPage(
      name: _Paths.UBAH,
      page: () => UbahPage(),
      binding: UbahBinding(),
    ),
    // GetPage(
    //   name: _Paths.PROFIL,
    //   page: () => ProfileView(),
    //   binding: ProfileBinding(),
    //   transition: Transition.fadeIn,
    // ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBindig(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegisterPage(),
      binding: RegistrationBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();

  static const INITIAL = Routes.MENU;

  static const MENU = _Paths.MENU;
  static const ADMIN = _Paths.ADMIN;
  static const BARU = _Paths.BARU;
  static const RIWAYAT = _Paths.RIWAYAT;
  static const UBAH = _Paths.UBAH;
  static const UPDATE_PROFILE = _Paths.UPDATE_PROFILE;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const PERMINTAAN = _Paths.PERMINTAAN;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
}

abstract class _Paths {
  static const MENU = '/menu';
  static const ADMIN = '/admin';
  static const BARU = '/baru';
  static const RIWAYAT = '/riwayat';
  static const UBAH = '/ubah';
  static const UPDATE_PROFILE = '/update-profile';
  static const CHANGE_PASSWORD = '/change-password';
  static const PERMINTAAN = '/permintaan';
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
}
