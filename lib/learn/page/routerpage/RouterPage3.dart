import 'package:flutter/material.dart';
class RouterPage3 extends StatefulWidget {
  const RouterPage3({Key? key}) : super(key: key);

  @override
  State<RouterPage3> createState() => _RouterPage3State();
}

class _RouterPage3State extends State<RouterPage3> {
  final _TAG = "RouterPage3";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouterPage3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RouterPage3'),
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
