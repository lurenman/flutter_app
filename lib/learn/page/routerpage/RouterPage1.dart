import 'package:flutter/material.dart';
class RouterPage1 extends StatefulWidget {
  const RouterPage1({Key? key}) : super(key: key);

  @override
  State<RouterPage1> createState() => _RouterPage1State();
}

class _RouterPage1State extends State<RouterPage1> {
  final _TAG = "RouterPage1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouterPage1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RouterPage1'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(18, 30, 18, 0),
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    "ceshi",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
