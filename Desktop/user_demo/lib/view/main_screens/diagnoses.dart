import 'package:flutter/material.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';

class DiagnosesScreen extends StatelessWidget {
  DiagnosesScreen({super.key});

  final UiController uiController = UiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiConstants.sndColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          "Diagnoses",
          style: TextStyle(
            color: Colors.black,
            fontFamily: uiController.getFont,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Text(
                      "initial diagnoses",
                      style: TextStyle(fontFamily: uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "diagnoses",
                      style: TextStyle(fontFamily: uiController.getFont),
                    ),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                //Initial diagnoses view
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.08,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: UiConstants.sndColor,
                            border: Border(bottom: BorderSide(width: 0.2))),
                        child: Text(
                          "date-time",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (c, i) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: UiConstants.sndColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: Offset(0, 1),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("date"),
                                    InkWell(
                                        onTap: () {
                                          //show dialog box
                                        },
                                        child: Icon(Icons.more_vert))
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
                //diagnoses view
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.08,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: UiConstants.sndColor,
                            border: Border(bottom: BorderSide(width: 0.2))),
                        child: Text(
                          "date-time",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (c, i) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: UiConstants.sndColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: Offset(0, 1),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("date"),
                                    InkWell(
                                        onTap: () {
                                          //show dialog box
                                        },
                                        child: Icon(Icons.more_vert))
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
