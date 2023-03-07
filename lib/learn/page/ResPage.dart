import 'package:flutter/material.dart';

class ResPage extends StatefulWidget {
  const ResPage({Key? key}) : super(key: key);

  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何导入和使用Flutter的资源文件'),
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
            Image(
              //需要在pubspec.yaml中声明
              image: AssetImage('images/type_district.png'),
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
