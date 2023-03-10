import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukk_revisi/pengunjung/riwayat/filter.dart';

import '../../widget/toast/custom_toach.dart';

class RiwayatController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatedata = false.obs;
  RxBool isLoadinghapus = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference data = firestore.collection("data");
  //   return data.get();
  // }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUserData() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("users").doc(uid).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> StreamData() async* {
    String uid = auth.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> user_query =
        await firestore.collection("users").doc(uid).get();

    if (user_query.data()?['role'] == "Pengunjung") {
      yield* firestore
          .collection("datauser")
          .orderBy("date", descending: true)
          .limitToLast(5)
          .snapshots();
    } else {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat merubah data",
        textConfirm: "Kembali",
        onConfirm: () {
          Get.back();
        },
      );
      // yield* firestore
      //     .collection("journals")
      //     .where('user_id', isEqualTo: uid)
      //     .orderBy("date", descending: true)
      //     .limitToLast(5)
      //     .snapshots();
    }
  }

  Future<void> actionhapus() async {
    if (isLoadinghapus.isFalse) {
      await deleteData;
    }
  }

  void deleteData(String uid) {
    try {
      DocumentReference docRef = firestore.collection("datauser").doc(uid);
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
    } catch (e) {
      isLoadinghapus.value = false;
      CustomToast.errorToast("Erro", "Error : ${e.toString()}");
    }
  }
}
