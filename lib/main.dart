import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/learn/page/AppLifecyclePage.dart';
import 'package:flutter_app/learn/page/PhotoAppPage.dart';
import 'package:flutter_app/learn/page/TestPluginPage.dart';
import 'package:flutter_app/learn/router/AppRouter.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

import 'learn/page/BlocPage.dart';
import 'learn/page/CityPickersPage.dart';
import 'learn/page/DataStoragePage.dart';
import 'learn/page/FFloatPage.dart';
import 'learn/page/FuturePage.dart';
import 'learn/page/GesturePage.dart';
import 'learn/page/LaunchPage.dart';
import 'learn/page/ResPage.dart';
import 'learn/page/ScrollablePositionedListPage.dart';
import 'learn/page/StatefullWidgetPage.dart';
import 'learn/page/StatelessWidgetPage.dart';
import 'learn/page/WebViewPage.dart';
import 'learn/page/WidgetLifecyclePage.dart';
import 'learn/page/animation/AnimationPage.dart';

/**
 * 库插件下载地址：https://pub.flutter-io.cn/
 *
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder>{
          'statelessPage': (BuildContext context) => StatelessWidgetPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 初始化路由
  FluroRouter router = AppRouter.router;

  @override
  void initState() {
    super.initState();
    AppRouter().defineRoutes();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(color: ColorUtil.color('#a9ee00')),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatelessWidgetPage()));
                        },
                        child: Text(
                          "StatelessWidgetPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatefullWidgetPage()));
                        },
                        child: Text(
                          "StatefullWidgetPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GesturePage()));
                        },
                        child: Text(
                          "GesturePage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResPage()));
                        },
                        child: Text(
                          "ResPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LaunchPage()));
                        },
                        child: Text(
                          "LaunchPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WidgetLifecyclePage()));
                        },
                        child: Text(
                          "WidgetLifecyclePage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppLifecyclePage()));
                        },
                        child: Text(
                          "AppLifecyclePage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotoAppPage()));
                        },
                        child: Text(
                          "PhotoAppPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimationPage()));
                        },
                        child: Text(
                          "AnimationPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataStoragePage()));
                        },
                        child: Text(
                          "数据存储",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FuturePage()));
                        },
                        child: Text(
                          "Future",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestPluginPage()));
                        },
                        child: Text(
                          "引用Test插件",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          //参考：https://blog.csdn.net/yikezhuixun/article/details/133066289
                          AppRouter.router.navigateTo(context, '/home2');
                        },
                        child: Text(
                          "Fluro",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocPage()));
                        },
                        child: Text(
                          "bloc",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityPickersPage()));
                        },
                        child: Text(
                          "CityPickers",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ScrollablePositionedListPage()));
                        },
                        child: Text(
                          "ScrollablePositionedList",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebViewPage()));
                        },
                        child: Text(
                          "WebViewPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FFloatPage()));
                        },
                        child: Text(
                          "FFloatPage",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
