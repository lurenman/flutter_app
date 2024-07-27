import 'package:flutter/material.dart';
class RouterPage2 extends StatefulWidget {
  const RouterPage2({Key? key}) : super(key: key);

  @override
  State<RouterPage2> createState() => _RouterPage2State();
}

class _RouterPage2State extends State<RouterPage2> {
  final _TAG = "RouterPage2";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouterPage2',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RouterPage2'),
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
                  onPressed: () {},
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
