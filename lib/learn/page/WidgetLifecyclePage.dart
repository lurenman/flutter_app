import 'package:flutter/material.dart';

/**
 * 参考：https://blog.csdn.net/yoonerloop/article/details/121003373
 */
class WidgetLifecyclePage extends StatefulWidget {
  const WidgetLifecyclePage({Key? key}) : super(key: key);

  @override
  _WidgetLifecyclePageState createState() => _WidgetLifecyclePageState();
}

class _WidgetLifecyclePageState extends State<WidgetLifecyclePage> {
  int _count = 0;
  String _TAG = "WidgetLifecycle";

  ///这是创建widget时调用的除构造方法外的第一个方法：
  ///类似于Android的：onCreate() 与iOS的 viewDidLoad()
  ///在这个方法中通常会做一些初始化工作，比如channel的初始化，监听器的初始化等
  @override
  void initState() {
    super.initState();
    print(_TAG + " initState");
  }

  ///当依赖的State对象改变时会调用：
  ///a.在第一次构建widget时，在initState（）之后立即调用此方法；
  ///b.如果的StatefulWidgets依赖于InheritedWidget，那么当当前State所依赖InheritedWidget中的变量改变时会再次调用它
  ///拓展：InheritedWidget可以高效的将数据在Widget树中向下传递、共享，可参考：https://book.flutterchina.club/chapter7/inherited_widget.html
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //在初始化initState后执行； 2、显示/关闭其它widget。 3、可执行多次；
    print(_TAG + " didChangeDependencies");
  }

  ///这是一个必须实现的方法，在这里实现你要呈现的页面内容：
  ///它会在在didChangeDependencies()之后立即调用；
  ///另外当调用setState后也会再次调用该方法；
  @override
  Widget build(BuildContext context) {
    print(_TAG + " build");
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("WidgetLifecyclePage"),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => LaunchPage()));
                },
                child: Text("点击"),
              ),
            ),
            Container(
              child: Text("count:${_count}"),
            )
          ],
        ),
      ),
    );
  }

  ///这是一个不常用到的生命周期方法，当父组件需要重新绘制时才会调用；
  ///该方法会携带一个oldWidget参数，可以将其与当前的widget进行对比以便执行一些额外的逻辑，如：
  /// if (oldWidget.xxx != widget.xxx)...
  @override
  void didUpdateWidget(covariant WidgetLifecyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(_TAG + " didUpdateWidget");
  }

  ///很少使用，在组件被移除时调用在dispose之前调用
  @override
  void deactivate() {
    super.deactivate();
    print(_TAG + " deactivate");
  }

  ///常用，组件被销毁时调用：
  ///通常在该方法中执行一些资源的释放工作比如，监听器的卸载，channel的销毁等
  @override
  void dispose() {
    super.dispose();
    print(_TAG + " dispose");
  }

//在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print(_TAG + " reassemble");
  }
}
