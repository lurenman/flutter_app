import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/learn/page/routerpage/RouterPage1.dart';

import '../page/routerpage/RouterPage2.dart';
import '../page/routerpage/RouterPage3.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal();

  static FluroRouter router = FluroRouter();

  // 添加路由处理方法
  void defineRoutes() {
    router.define('/home1',
        handler: Handler(handlerFunc: (context, parameters) => RouterPage1()));
    router.define('/home2',
        transitionType: TransitionType.fadeIn,
        handler: Handler(handlerFunc: (context, parameters) => RouterPage2()));
    router.define('/home3',
        handler: Handler(handlerFunc: (context, parameters) => RouterPage3()));
    // router.define('/home2', handler: homeHandler);
    // 定义其他路由...
  }

// 定义路由处理器
// final homeHandler = Handler(
//   handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return HomePage();
//   },
// );
}
