import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/toast/custom_toach.dart';

class AdminPermintaanController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatedata = false.obs;
  String int = "0";

  TextEditingController statusC = TextEditingController();
  String status = "status";
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> Permintaan() {
    CollectionReference data = firestore.collection("data");
    return data.snapshots();
  }

  Future<void> actionTerima() async {
    if (isLoading.isFalse) {
      await terima();
    }
  }

  Future<void> actionTolak() async {
    if (isLoading.isFalse) {
      await tolak();
    }
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
  terima() async {
    DocumentReference doc = firestore.collection("data").doc("status");
    try {
      await doc.update({"status": 1});
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat merubah data",
        textConfirm: "Kembali",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  tolak() async {
    DocumentReference doc = firestore.collection("data").doc("status");
    try {
      await doc.update({"status": 2});
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat merubah data",
        textConfirm: "Kembali",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
