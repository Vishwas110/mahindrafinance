import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mahindra_finance_calendar/models/Datelist.dart';

import 'models/Total.dart';


class AllDates extends StatefulWidget {
  const AllDates() : super();

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<AllDates> with SingleTickerProviderStateMixin {


  List<Total> users = [
    Total(date: "1 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "3 April", hrd: "1",tech1: "5",followup: "3",total: "9"),
    Total(date: "7 April", hrd: "12",tech1: "15",followup: "2",total: "29"),
    Total(date: "8 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "4 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "3 April", hrd: "5",tech1: "5",followup: "2",total: "12"),
    Total(date: "22 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "2 April", hrd: "2",tech1: "15",followup: "2",total: "19"),
    Total(date: "4 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "13 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "17 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "24 April", hrd: "2",tech1: "5",followup: "2",total: "9"),
    Total(date: "11 April", hrd: "2",tech1: "5",followup: "2",total: "10"),


  ];


  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:SingleChildScrollView(
        child:  Column(children: users.map((dateRecord){
          return Container(
            child:Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      //offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.1), //edited
                        spreadRadius: 4,
                        blurRadius: 10 //edited
                    )
                  ],
                ),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        height: 80,
                        width: 3,
                        color: Colors.red,
                      ),
                      Column(
                        children: [
                          Text(
                            dateRecord.date,
                            style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              width: 55.0,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text(dateRecord.hrd),)
                          ),
                          Text("HRD",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              width: 55.0,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text(dateRecord.tech1),)
                          ),
                          Text("Tech1",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              width: 55.0,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text(dateRecord.followup),)
                          ),
                          Text("Follow up",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              width: 55.0,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text(dateRecord.total,style: TextStyle(color: Colors.white),),)
                          ),
                          Text("Total",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ],
                  ),
                )),
            //margin: EdgeInsets.all(5),
            //padding: EdgeInsets.all(5),
            // color: Colors.green[100],
          );
        }).toList(),
      )
      )
    );





  }
}
