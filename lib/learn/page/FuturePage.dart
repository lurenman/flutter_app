import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * https://blog.csdn.net/weixin_44051815/article/details/121612206
 * https://blog.csdn.net/Lastdoggod/article/details/125831580
 */
class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final _TAG = "FuturePageState";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuturePage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FuturePage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(18, 20, 18, 0),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      var result = testFuture();
                      //onError和catchError 互斥 优先onError
                      result.then((value) {
                        Fluttertoast.showToast(
                            msg: value, textColor: Colors.black);
                      }).onError((error, stackTrace) {
                        Fluttertoast.showToast(
                            msg: error.toString(), textColor: Colors.black);
                        print(_TAG + " onError ${error.toString()}");
                      }).catchError((e) {
                        print(_TAG + " catchError ${e.toString()}");
                      }).whenComplete(() => print(_TAG + " whenComplete"));
                    },
                    child: Text(
                      "测试",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              FutureBuilder(
                future: Future.delayed(
                    Duration(seconds: 3), () => throw ("Error")), // () => 30
                initialData: 80, //snapshot.hasData
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Text("hasData");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text("Error");
                    }
                    return Text("${snapshot.data}",
                        style: TextStyle(fontSize: 70));
                  } else {
                    return Text("else");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> testFuture() {
    //throw new Error();
    // return Future.value("success");
    return Future.error("error");
  }
}
