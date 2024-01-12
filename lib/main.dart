import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mahindra_finance_calendar/AllDates.dart';
import 'package:mahindra_finance_calendar/Followup.dart';
import 'package:mahindra_finance_calendar/Hrd.dart';
import 'package:mahindra_finance_calendar/Tech1.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';



void main() {
  runApp(MaterialApp(home: MyApp()));


}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{


  late TabController _tabController;

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();





  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {

    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';

      } else if (args.value is PickerDateRange) {
        _selectedDate = '${args.value.toString()}';
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }


    });
  }



  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('DatePicker demo'),
          ),

          body:  Stack(
            children: <Widget>[
             Column(
               children: [
                 Container(
                   height: 250,
                   child: SfDateRangePicker(
                     onSelectionChanged: _onSelectionChanged,
                     selectionMode: DateRangePickerSelectionMode.range,
                     initialSelectedRange: PickerDateRange(
                         DateTime.now().subtract(const Duration(days: 4)),
                         DateTime.now().add(const Duration(days: 3))),
                   ),

                 ),
                 Container(

                   height: 80,
                   child: Column(

                     children: <Widget>[
                       Text('Selected date: '+_selectedDate.toString()),
                       Text('Selected date count: $_dateCount'),
                       Text('Selected range: $_range'),
                       Text('Selected ranges count: $_rangeCount')
                     ],
                   ),
                 ),
               ],
             ),
              //CustomHeader(),
              DraggableScrollableSheet(

                key: _sheet,
                // initialChildSize: 0.5,
                 maxChildSize: 1,
              //  minChildSize: 0,
                initialChildSize: 0.70,
                minChildSize: 0.40,
                expand: true,
                snap: true,

                snapSizes: const [0.8],
                controller: _controller,
                builder: (BuildContext context, ScrollController scrollController) {
                  return DecoratedBox(
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                         SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            color: Colors.white,
                            width: 2,
                            height: 1,
                          //  alignment: Alignment.center,

                          )
                        ),
                        SliverList.list(
                          children:  [
                            TabBar(
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              indicatorWeight: 2,
                              tabs: [
                                Tab(
                                  text: 'All',
                                ),
                                Tab(
                                  text: 'HRD',
                                ),
                                Tab(
                                  text: 'Tech1',
                                ),
                                Tab(
                                  text: 'Follow up',
                                )
                              ],
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            Container(
                              height:700,
                              child: TabBarView(
                                children: [
                                  AllDates(),
                                  Hrd(),
                                  Tech1(),
                                  Followup(),
                                ],
                                controller: _tabController,
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),



        ));


  }

   selectionChanged(DateRangePickerSelectionChangedArgs args) {
    _selectedDate = DateFormat('dd MMMM, yyyy').format(args.value);

    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {
        print("object"+duration.inDays.toString());
      });
    });
  }
  // Container(
  // child: Column(
  // crossAxisAlignment: CrossAxisAlignment.center,
  // children: [
  //
  //




}





