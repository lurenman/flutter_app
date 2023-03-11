import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plugin_test/flutter_plugin_test.dart';

class TestPluginPage extends StatefulWidget {
  const TestPluginPage({Key? key}) : super(key: key);

  @override
  State<TestPluginPage> createState() => _TestPluginPageState();
}

class _TestPluginPageState extends State<TestPluginPage> {
  final _TAG = "TestPluginPageState";
  String _mResult = 'Unknown';
  final _flutterPluginTestPlugin = FlutterPluginTest();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestPluginPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TestPluginPage'),
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
                  style: ElevatedButton.styleFrom(),
                  onPressed: () async {
                    try {
                      // var result = await _flutterPluginTestPlugin.getResult(1, 2);
                      var result = await _flutterPluginTestPlugin.getBlackbox();
                      setState(() {
                        if (result != null) {
                          _mResult = result;
                        }
                      });
                      print(_TAG + " result: ${result}");
                    } on PlatformException catch (err) {
                      // Handle
                      print(_TAG + " Handle err: ${err.toString()}");
                    } catch (err) {
                      // other types of Exceptions
                      print(_TAG +
                          " other types of Exceptions: ${err.toString()}");
                    }
                  },
                  child: Text(
                    "MethodChannel",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("the result : ${_mResult}"),
            )
          ],
        ),
      ),
    );
  }
}
