import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/toast/custom_toach.dart';

class AdminPermintaanController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatedata = false.obs;
  RxBool isLoadingTolak = false.obs;
  RxBool isLoadingTerima = false.obs;

  TextEditingController statusC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> Permintaan() {
    CollectionReference data = firestore.collection("data");
    return data.snapshots();
  }

  // void terima(String Status, String docID) async {
  //   DocumentReference doc = firestore.collection("data").doc(docID);
  //   try {
  //     await doc.update({"status": 1});
  //   } catch (e) {
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Tidak dapat merubah data",
  //       textConfirm: "Kembali",
  //       onConfirm: () {
  //         Get.back();
  //       },
  //     );
  //   }
  // }

  // void tolak(String Status, String docID) async {
  //   DocumentReference doc = firestore.collection("data").doc(docID);
  //   try {
  //     await doc.update({"status": 2});
  //   } catch (e) {
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Tidak dapat merubah data",
  //       textConfirm: "Kembali",
  //       onConfirm: () {
  //         Get.back();
  //       },
  //     );
  //   }
  // }
}
