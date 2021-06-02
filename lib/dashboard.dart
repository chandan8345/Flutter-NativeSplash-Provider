import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool state = false;

  Map<String, double> dataMap = {
    "Target": 1000,
    "Achievement": 900,
  };

  Map<String, double> dataManPower = {
    "Line 1": 10,
    "Line 2": 18,
    "Line 3": 20,
    "Line 4": 17,
    "Line 5": 19,
  };

  List<VBarChartModel> bardata = [
    VBarChartModel(
      index: 0,
      label: "Line 1",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: 160,
      tooltip: "160 Pcs",
      description: Text(
        "Target not achieved due to manpower",
        style: TextStyle(fontSize: 10),
      ),
    ),
    VBarChartModel(
      index: 1,
      label: "Line 2",
      colors: [Colors.greenAccent, Colors.green],
      jumlah: 200,
      tooltip: "200 Pcs",
      description: Text(
        "Target Achieved",
        style: TextStyle(fontSize: 10),
      ),
    ),
    VBarChartModel(
      index: 2,
      label: "Line 3",
      colors: [Colors.greenAccent, Colors.green],
      jumlah: 170,
      tooltip: "170 Pcs",
    ),
    VBarChartModel(
      index: 3,
      label: "Line 4",
      colors: [Colors.greenAccent, Colors.green],
      jumlah: 190,
      tooltip: "190 Pcs",
    ),
    VBarChartModel(
      index: 4,
      label: "Line 5",
      colors: [Colors.greenAccent, Colors.green],
      jumlah: 180,
      tooltip: "180 Pcs",
    ),
  ];

  void initState() {
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Card(
              color: Colors.pink,
              elevation: 10.0,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Line Wise Target & Achievment',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  VerticalBarchart(
                    maxX: 200,
                    data: bardata,
                    showLegend: true,
                    alwaysShowDescription: true,
                    showBackdrop: true,
                    legend: [
                      Vlegend(
                        isSquare: false,
                        color: Colors.green,
                        text: "Target achieved",
                      ),
                      Vlegend(
                        isSquare: false,
                        color: Colors.orange,
                        text: "Target not achieved",
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.white,
              elevation: 10.0,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Target vs Achievement',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 1000)
              ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.white,
              elevation: 10.0,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Line Wise Manpower',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PieChart(
                      dataMap: dataManPower,
                      animationDuration: Duration(milliseconds: 1000)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: false,
        title: Text(
          'Dashboard',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.person_alt_circle,
              color: Colors.lightBlue,
              size: 30,
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     elevation: 5.0,
      //     child: Icon(Icons.screen_rotation),
      //     backgroundColor: Colors.blue,
      //     onPressed: () {
      //       if (state == false) {
      //         setState(() {
      //           this.state = true;
      //         });
      //         SystemChrome.setPreferredOrientations([
      //           DeviceOrientation.landscapeRight,
      //           DeviceOrientation.landscapeLeft,
      //         ]);
      //       } else {
      //         setState(() {
      //           this.state = false;
      //         });
      //         SystemChrome.setPreferredOrientations([
      //           DeviceOrientation.portraitUp,
      //           DeviceOrientation.portraitDown,
      //         ]);
      //       }
      //     })
    );
  }
}
