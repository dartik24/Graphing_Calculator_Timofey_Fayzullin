import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fp/graph_page.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  double num1 = 0, num2 = 0, sum = 0;
  Text dn = Text("Dark");
  Color dfbc = Colors.white;
  Color dfc = Colors.blue;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSubtraction() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMultiplication() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDivision() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 / num2;
    });
  }

  void doPower() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      if (num2 < 0) {
        num1 = (1 / num1);
        num2 = (num2 * -1);
      }
      for (double i = 0; i < num2; i++) {
        if (sum != 0) {
          sum = sum * num1;
        } else {
          sum = num1;
        }
      }
    });
  }

  void doFactorial() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      for (double i = 0; i <= num1; i++) {
        sum = sum + i;
      }
    });
  }

  void doCos() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      sum = cos(num1);
    });
  }

  void doSin() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      sum = sin(num1);
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

  void doTan() {
    setState(() {
      sum = 0;
      num1 = double.parse(t1.text);
      sum = tan(num1);
    });
  }

  void doClear() {
    setState(() {
      num1 = 0;
      num2 = 0;
      t1.text = "0";
      t2.text = "0";
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: dfbc,
      appBar: new AppBar(
        backgroundColor: dfc,
        foregroundColor: dfbc,
        title: new Text("Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(12.5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output : $sum",
              style: new TextStyle(
                  fontSize: 25.0, fontWeight: FontWeight.bold, color: dfc),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
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
                  hintText: ("Enter Number 1"),
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
                  hintText: ("Enter Number 1"),
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
                  child: new Text("+"),
                  color: dfc,
                  onPressed: doAddition,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: dfc,
                  onPressed: doSubtraction,
                ),
                new MaterialButton(
                  child: new Text("!"),
                  color: dfc,
                  onPressed: doFactorial,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("*"),
                  color: dfc,
                  onPressed: doMultiplication,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  color: dfc,
                  onPressed: doDivision,
                ),
                new MaterialButton(
                  child: new Text("^"),
                  color: dfc,
                  onPressed: doPower,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("cos"),
                  color: dfc,
                  onPressed: doCos,
                ),
                new MaterialButton(
                  child: new Text("sin"),
                  color: dfc,
                  onPressed: doSin,
                ),
                new MaterialButton(
                  child: new Text("tan"),
                  color: dfc,
                  onPressed: doTan,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: dfc,
                  onPressed: doClear,
                ),
                new MaterialButton(
                  child: dn,
                  color: dfc,
                  onPressed: doDM,
                ),
                new MaterialButton(
                  child: new Text("Graph"),
                  color: dfc,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GraphPage()));
                  }, //NextPage
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
