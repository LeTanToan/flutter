import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentContronller = TextEditingController();
  final _amountContronller = TextEditingController();
  //define states
  late String _content;
  late Double  _amount;

  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  void dispose(){
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime someDatime = new DateTime(2023, 2, 14);
    return MaterialApp(
      title: "This is statefulwidget",
      home: Scaffold(
        // key: _scaffoldKey,
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'ConTent'),
                  controller: _contentContronller,
                  onChanged: (text){
                    setState(() {
                     _content = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount(Money)'),
                  controller: _amountContronller,
                    onChanged: (text) {
                      setState(() {
                        double _amount= double.parse(text) ;
                      });
                    }
                ),
                TextButton(onPressed: (){
                  // print('Content = $_content, money\'s amount = $_amount');
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('Content = $_content, money\'s amount = $_amount'),
                  //   duration: Duration(seconds: 3),)
                  // );
                  print('Content = $_content, money = $_amount');
                },
                    style: TextButton.styleFrom(
                      //backgroundColor: Colors.white, // background
                      primary: Colors.white,
                      backgroundColor: Colors.blue// foreground
                    ),
                    child: Text('Insert Transaction', style: TextStyle(fontSize: 20))
                )
          ],
        ),)
      ),
    );
  }
}