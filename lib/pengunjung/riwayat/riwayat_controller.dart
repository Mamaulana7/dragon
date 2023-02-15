import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukk_revisi/pengunjung/riwayat/filter.dart';

class RiwayatController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatedata = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference data = firestore.collection("data");
  //   return data.get();
  // }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference data = firestore.collection("data");
    return data.snapshots();
  }

  void deleteData(String namaC) {
    DocumentReference docRef = firestore.collection("data").doc(namaC);
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Hapus Data",
      middleText: "Apakah anda yakin ?",
      onConfirm: () async {
        await docRef.delete();
        Get.back();
      },
      textConfirm: "Iya",
      textCancel: "Tidak",
    );
  }
}
