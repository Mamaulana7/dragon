import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:ukk_revisi/controllers/page_index_controller.dart';
import 'package:ukk_revisi/controllers/page_index_controller.dart';
import 'package:ukk_revisi/widget/toast/custom_toach.dart';
import 'package:uuid/uuid.dart';
import 'package:ukk_revisi/pengunjung/data/baru.dart';

class BaruController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingdatabaru = false.obs;

  TextEditingController namaC = TextEditingController();
  TextEditingController asalC = TextEditingController();
  TextEditingController suhuC = TextEditingController();

  // ambil data
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> tambahdata() async {
    if (asalC.text.isNotEmpty && suhuC.text.isNotEmpty) {
      isLoading.value = true;

      if (isLoadingdatabaru.isFalse) {
        await baru();
        isLoading.value = false;
        namaC.text = "";
        asalC.text = "";
        suhuC.text = "";
      }
    } else {
      isLoading.value = false;
      CustomToast.errorToast('Error', 'Semua Input Harus diisi');
    }
  }

  baru() async {
    isLoadingdatabaru.value = false;

    try {
      DocumentReference respons = firestore.collection("data").doc(namaC.text);
      respons.set({
        "Nama": namaC.text,
        "Dari": asalC.text,
        "Suhu": suhuC.text,
        "date": DateTime.now().toIso8601String(),
        "status": 0,
      });
      CustomToast.successToast("Success", "Data Telah Ditambahkan");
      isLoadingdatabaru.value = false;
    } catch (e) {
      isLoadingdatabaru.value = false;
      CustomToast.errorToast("Error", "Error : ${e.toString()}");
    }
  }
}
