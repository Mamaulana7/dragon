import 'package:flutter/material.dart';
import 'package:ukk_revisi/controllers/page_index_controller.dart';
import '../app_color.dart';
import 'package:get/get.dart';
import 'package:ukk_revisi/widget/app_color.dart';

class CustomBottomNavigationBarGuru extends GetView<PageIndexController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Stack(
        alignment: new FractionalOffset(.5, 1.0),
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColor.secondaryExtraSoft, width: 1),
                ),
              ),
              child: BottomAppBar(
                shape: CircularNotchedRectangle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () => controller.changePage(0),
                        child: Container(
                          height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: (controller.pageIndex.value == 0)
                                    ? Icon(Icons.home_rounded)
                                    : Icon(Icons.home_outlined),
                                margin: EdgeInsets.only(bottom: 4),
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColor.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => controller.changePage(2),
                        child: Container(
                          height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: (controller.pageIndex.value == 2)
                                    ? Icon(
                                        Icons.supervised_user_circle_outlined)
                                    : Icon(
                                        Icons.supervised_user_circle_rounded),
                                margin: EdgeInsets.only(bottom: 4),
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColor.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
