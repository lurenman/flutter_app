import 'package:flutter/material.dart';

/**
 * 参考：
 * https://blog.csdn.net/wywinstonwy/article/details/122445684
 */
class HeroAnimationPage extends StatefulWidget {
  const HeroAnimationPage({Key? key}) : super(key: key);

  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeroAnimationPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('HeroAnimationPage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 100),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              InkWell(
                child: Hero(
                  tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                  child: ClipOval(
                    child: Image.network(
                      'http://www.devio.org/img/avatar.png',
                      width: 100.0,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: Text("原图"),
                          ),
                          body: HeroAnimationRouteB(),
                        ),
                      );
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.network('http://www.devio.org/img/avatar.png'),
      ),
    );
  }
}
