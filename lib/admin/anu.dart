import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';
import 'package:ukk_revisi/navbar.dart';
import 'package:flutter/services.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(0, 78, 2, 2),
    // ));
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        drawer:  NavBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 188, 251, 255),
          title: Row(
              children: [
                Container(
            padding: EdgeInsets.only(left: 60),
            child: Text('Enjoy.',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 3,),
            Container(
              child: Text('ID',
                style: TextStyle(
                  color: Color.fromARGB(255, 226, 147, 0),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              ],
          ),
          bottom: TabBar(tabs: [
            Tab(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),),
                child: Text('Permintaan',
                style: TextStyle(
                  color: Colors.black,
                ),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(color: Color.fromARGB(0, 255, 255, 255),),
                child: Text('Riwayat',
                style: TextStyle(
                  color: Colors.black,
                ),
                ),
              ),
            ),
          ]), 
        ),
        body: TabBarView(children: [
          buildp1anu(),
          buildp2()
        ],)
      ),
    );
  }
  Widget buildp1anu(){
    return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.only(left: 12,right: 12, top: 18),
                width: 350,
                height: 40,
                decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(hintText: "Urutkan Tanggal",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                ),
              ),
              SizedBox(height: 12,),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22, right: 20,),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 180, 255, 249),
                        borderRadius: BorderRadius.circular(5),
                        ),
                        height: 160,
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
                              child: Text('Jumat, 23-10-2021',
                              style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    fontSize: 15,
                                    ),
                                ),
                              ),
                           ),
                           SizedBox(height: 5,),
                           Container(
                            margin: EdgeInsets.only(left: 18,),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Text('Pak Didik ',
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    ),
                                ),
                              ),
                           ),
                           SizedBox(height: 5,),
                           Container(
                            margin: EdgeInsets.only(left: 18,),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Text('Dubai, Uni Emirat Arab',
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    ),
                                ),
                              ),
                           ),
                           SizedBox(height: 5,),
                           Container( 
                            margin: EdgeInsets.only(left: 18,),
                            decoration: BoxDecoration(color: Color.fromARGB(0, 5, 5, 5),),
                            child: 
                            Row(
                              children: [
                                Text('Suhu tubuh:',
                                    style: GoogleFonts.secularOne(
                                      textStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 15,
                                        ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('39.9',
                                    style: GoogleFonts.secularOne(
                                      textStyle: TextStyle(
                                        color: Color.fromARGB(255, 153, 153, 153),
                                        fontSize: 15,
                                        ),
                                    ),
                                  ),
                              ],
                            ),
                           ),
                          SizedBox(height: 2,),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(color:Color.fromARGB(0, 160, 89, 89),),
                            child: 
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 5,),
                                  margin: EdgeInsets.only(left: 8,),
                                  width: 170,
                                  height: 30,
                                  color: Color.fromARGB(0, 33, 149, 243),
                                  child: Text('Terima',
                                  textAlign: TextAlign.center,
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 17, 179, 2),
                                    fontSize: 17,
                                    ),
                                ),
                              ),
                                ),
                                SizedBox(width: 1,),
                                Container(
                                  padding: EdgeInsets.only(top: 5,),
                                  width: 165,
                                  height: 30,
                                  color: Color.fromARGB(0, 33, 149, 243),
                                  child: Text('Tolak',
                                  textAlign: TextAlign.center,
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 199, 3, 3),
                                    fontSize: 17,
                                    ),
                                ),
                              ),
                                ),
                              ],
                            ),
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
              ),
            ],
          ),
        );
  }
  Widget buildp2(){
    return Container(
      padding: EdgeInsets.only(top: 35,),
    );
  }
}