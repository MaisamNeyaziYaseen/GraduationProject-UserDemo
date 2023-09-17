import 'package:flutter/material.dart';
import 'package:user_demo/controller/ui_controller.dart';

import '../../utils/ui_constants.dart';

class AppointmentsScreen extends StatelessWidget {
  AppointmentsScreen({super.key});

  final UiController uiController = UiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiConstants.sndColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          "Appointments",
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
                      "upcoming",
                      style: TextStyle(fontFamily: uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "history",
                      style: TextStyle(fontFamily: uiController.getFont),
                    ),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                //upcoming appiontments view
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: UiConstants.sndColor,
                          border: Border(bottom: BorderSide(width: 0.2))),
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "optics center",
                                style: TextStyle(color: Colors.grey),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                "date-time",
                                style: TextStyle(color: Colors.grey),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (c, i) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
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
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text("name")),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("date"),
                                            TextButton(
                                                onPressed: () {
                                                  //cancel appointment
                                                },
                                                child: Text(
                                                  "cancel",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ))
                                          ],
                                        )),
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
                //appointments' history view
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: UiConstants.sndColor,
                          border: Border(bottom: BorderSide(width: 0.2))),
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 3.0,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "optics center",
                                style: TextStyle(color: Colors.grey),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width / 3.0,
                              child: Text(
                                "date-time",
                                style: TextStyle(color: Colors.grey),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width / 3.0,
                              child: Text(
                                "state",
                                style: TextStyle(color: Colors.grey),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (c, i) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
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
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text("name")),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text("date")),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("state"),
                                            InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.more_vert))
                                          ],
                                        )),
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
