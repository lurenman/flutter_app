import 'dart:io';

import 'package:flutter/material.dart';

class AppLifecyclePage extends StatefulWidget {
  const AppLifecyclePage({Key? key}) : super(key: key);

  @override
  _AppLifecyclePageState createState() => _AppLifecyclePageState();
}

class _AppLifecyclePageState extends State<AppLifecyclePage>
    with WidgetsBindingObserver {
  String _TAG = "AppLifecyclePageState";

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isIOS) {
      print("IOS");
    } else if (Platform.isAndroid) {
      print("安卓");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppLifecyclePage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppLifecyclePage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Text("app声明周期"),
        ),
      ),
    );
  }

  /**
   * 1、resumed
      可见并能响应用户的输入，同安卓的onResume

      2、inactive
      处在并不活动状态，无法处理用户响应，同安卓的onPause

      3、paused
      不可见并不能响应用户的输入，但是在后台继续活动中，同安卓的onStop
   */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(_TAG + ' state = $state');
    if (state == AppLifecycleState.paused) {
      print(_TAG + ' AppLifecycleState.paused');
    } else if (state == AppLifecycleState.resumed) {
      print(_TAG + ' AppLifecycleState.resumed');
    } else if (state == AppLifecycleState.inactive) {
      print(_TAG + ' AppLifecycleState.inactive');
    } else if (state == AppLifecycleState.detached) {
      print(_TAG + ' AppLifecycleState.detached');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
