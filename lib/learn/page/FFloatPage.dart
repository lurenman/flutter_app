import 'package:ffloat_nullsafety/ffloat_nullsafety.dart';
import 'package:flutter/material.dart';

class FFloatPage extends StatefulWidget {
  const FFloatPage({Key? key}) : super(key: key);

  @override
  State<FFloatPage> createState() => _FFloatPageState();
}

class _FFloatPageState extends State<FFloatPage> {
  final _TAG = "FFloatPage";

  FFloatController controller = FFloatController();
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FFloatPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FFloatPage'),
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
                    if (isShow) {
                      /// show float
                      controller.show();
                    } else {
                      /// hide float
                      controller.dismiss();
                    }
                    isShow = !isShow;
                  },
                  child: Text(
                    "测试",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              //一定要指定容器大小
              height: 100,
              child: FFloat(
                (setter, contentState) => Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("hello"),
                ),
                controller: controller,
                padding: EdgeInsets.only(left: 9, right: 9, top: 6, bottom: 6),
                corner: FFloatCorner.all(10),
                alignment: FFloatAlignment.topCenter,
                canTouchOutside: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
