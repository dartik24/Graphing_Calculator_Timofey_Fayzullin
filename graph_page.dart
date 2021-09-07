import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_plot/flutter_plot.dart';

class GraphPage extends StatefulWidget {
  @override
  State createState() => new GraphPageState();
}

class GraphPageState extends State<GraphPage> {
  Text dn = Text("Dark");
  Color dfbc = Colors.white;
  Color dfc = Colors.blue;
  double num1 = 0, num2 = 0;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  List<Point> data = [
    const Point(0, 0),
  ];

  void doPoint() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      data.add(Point(num1, num2));
    });
  }

  void doclear() {
    setState(() {
      num1 = 0;
      num2 = 0;
      t1.text = "0";
      t2.text = "0";
      data.removeRange(1, data.length);
    });
  }

  void doDM() {
    setState(() {
      if (dfc == Colors.blue) {
        dfc = Colors.grey;
        dn = Text("Light");
      } else {
        dfc = Colors.blue;
        dn = Text("Dark");
      }
      if (dfbc == Colors.white) {
        dfbc = Colors.white10;
      } else {
        dfbc = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dfbc,
      appBar: AppBar(
        backgroundColor: dfc,
        foregroundColor: dfbc,
        title: Text('Graph Page'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: new Text('Graph Grid'),
                ),
                new Container(
                  child: new Plot(
                    height: 400.0,
                    data: data,
                    gridSize: new Offset(1.0, 1.0),
                    style: new PlotStyle(
                      pointRadius: 3.0,
                      outlineRadius: 1.0,
                      primary: Colors.black,
                      secondary: Colors.black,
                      trace: true,
                      traceStokeWidth: 3.0,
                      traceColor: dfc,
                      traceClose: true,
                      showCoordinates: true,
                      textStyle: new TextStyle(
                        fontSize: 6.0,
                        color: Colors.black,
                      ),
                      axis: Colors.black,
                      gridline: Colors.grey,
                    ),
                    padding: const EdgeInsets.fromLTRB(40.0, 12.0, 12.0, 40.0),
                    xTitle: 'My X Title',
                    yTitle: 'My Y Title',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 315.0,
            child: new TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: dfc),
                ),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: dfc)),
                hintText: ("Enter X coordinat"),
              ),
              style: TextStyle(color: dfc),
              cursorColor: dfc,
              controller: t1,
            ),
          ),
          Container(
            width: 315.0,
            child: new TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: dfc),
                ),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: dfc)),
                hintText: ("Enter Y coordinate"),
              ),
              style: TextStyle(color: dfc),
              cursorColor: dfc,
              controller: t2,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 10.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new MaterialButton(
                child: dn,
                color: dfc,
                onPressed: doDM,
              ),
              new MaterialButton(
                child: Text('Clear'),
                color: dfc,
                onPressed: doclear,
              ),
              new MaterialButton(
                child: Text('Graph'),
                color: dfc,
                onPressed: doPoint,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
