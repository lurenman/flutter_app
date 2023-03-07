import 'package:flutter/material.dart';

import 'HeroAnimationPage.dart';
import 'SimulationAnimationPage.dart';
import 'TweenAnimationPage.dart';

/**
 *参考：https://blog.csdn.net/qq_14876133/article/details/121834646
 * https://blog.csdn.net/Calvin_zhou/article/details/116306351
 */
class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimationPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('AnimationPage'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TweenAnimationPage()));
                      },
                      child: Text(
                        "Tween动画",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimulationAnimationPage()));
                      },
                      child: Text(
                        "物理动画",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HeroAnimationPage()));
                      },
                      child: Text(
                        "hero动画",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
