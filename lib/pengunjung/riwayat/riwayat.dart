import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_revisi/pengunjung/riwayat/filter.dart';
import 'package:ukk_revisi/pengunjung/riwayat/riwaya_binding.dart';
import 'package:ukk_revisi/pengunjung/riwayat/riwayat_controller.dart';
import 'package:ukk_revisi/pengunjung/ubah/ubah.dart';
import 'package:ukk_revisi/routes/app_pages.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  TextEditingController _namaC = TextEditingController();
  TextEditingController _dataC = TextEditingController();
  TextEditingController _suhuC = TextEditingController();

  final controller = Get.find<RiwayatController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 2),
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
                hintText: "Urutkan Tanggal",
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.StreamData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var carddata = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: carddata.length,
                      itemBuilder: (context, index) => Container(
                        margin:
                            EdgeInsets.only(left: 22, right: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 180, 255, 249),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 177,
                        width: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              padding: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 168, 82, 82),
                              ),
                              width: 330,
                              height: 30,
                              child: Text(
                                "${(carddata[index].data() as Map<String, dynamic>)["date"]}",
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Text(
                                "Nama: ${(carddata[index].data() as Map<String, dynamic>)["Nama"]}",
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Text(
                                "Dari: ${(carddata[index].data() as Map<String, dynamic>)["Dari"]}",
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Suhu tubuh: ${(carddata[index].data() as Map<String, dynamic>)["Suhu"]}",
                                    style: GoogleFonts.secularOne(
                                      textStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 156, top: 9),
                                    child: Text(""
                                        // (carddata["status"] == 0)
                                        // ? "Status : Belum dibaca"
                                        // : (carddata["status"] == 1)
                                        //     ? "Status : Diterima"
                                        //     : "Status : Ditolak",
                                        //   style: GoogleFonts.secularOne(
                                        //     textStyle: TextStyle(
                                        //       color: Color.fromARGB(255, 0, 0, 0),
                                        //       fontSize: 20,
                                        //     ),
                                        //   ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 231, 97, 97),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(0, 255, 193, 7)),
                                    width: 200,
                                    margin: EdgeInsets.only(left: 20),
                                    child: TextButton(
                                      onPressed: () => Get.toNamed(Routes.UBAH,
                                          arguments: carddata[index].id),
                                      child: Text(
                                        'ubah',
                                        style: GoogleFonts.secularOne(
                                          textStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 46, 247, 63),
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(0, 255, 193, 7)),
                                    width: 200,
                                    margin: EdgeInsets.only(left: 23),
                                    child: TextButton(
                                      onPressed: () {
                                        controller
                                            .deleteData(carddata[index].id);
                                      },
                                      child: Text(
                                        'Hapus',
                                        style: GoogleFonts.secularOne(
                                          textStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
