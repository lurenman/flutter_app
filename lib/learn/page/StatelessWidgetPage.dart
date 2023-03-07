import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatelessWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StatelessWidgetPage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('StatelessWidgetPage'),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            //    color: Colors.red,
            padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              //mainAxisSize:MainAxisSize.min, 相当于包裹内容了
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {},
                      child: Text(
                        "Button",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
