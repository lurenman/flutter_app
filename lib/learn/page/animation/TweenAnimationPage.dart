import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 参考:https://blog.csdn.net/qq_14876133/article/details/121834646
 * https://www.jianshu.com/p/f725c09546be
 */
class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  _TweenAnimationPageState createState() => _TweenAnimationPageState();
}

////动画控制器  duration 播放时长 vsync 同步，State 需要实现 SingleTickerProviderStateMixin,针对多个实现TickerProviderStateMixin
class _TweenAnimationPageState extends State<TweenAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  double _scaleSize = 100;

  late AnimationController _alphaController;
  double _opacity = 1;

  late AnimationController _rotationController;
  double _rotation = 1;

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        lowerBound: 100,
        upperBound: 200)
      ..addListener(() {
        setState(() {
          _scaleSize = _scaleController.value;
        });
      });

    _alphaController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              _opacity = _alphaController.value;
            });
          });

    _rotationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 1,
        upperBound: 2)
      ..addListener(() {
        setState(() {
          _rotation = _rotationController.value;
        });
      });

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          });
    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TweenAnimationPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TweenAnimationPage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(18, 30, 18, 30),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      _scaleController.forward();
                      _alphaController.forward();
                      _rotationController.forward();
                      _controller.forward();
                    },
                    child: Text(
                      "开启动画",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    _scaleWidget(),
                    _alphaWidget(),
                    _rotationWidget(),
                    _cWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _alphaController.dispose();
    _rotationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _scaleWidget() {
    return Container(
      color: Colors.blue,
      width: _scaleSize,
      height: _scaleSize / 2,
    );
  }

  Widget _alphaWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: Colors.red.withOpacity(_opacity),
      width: _scaleSize,
      height: _scaleSize / 2,
      transformAlignment: Alignment.center,
    );
  }

  Widget _rotationWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: Colors.blue,
      width: _scaleSize,
      height: _scaleSize / 2,
      transformAlignment: Alignment.center,
      // transform: Matrix4.rotationZ(100 / _rotation),
      transform: Matrix4.rotationX(100 / _rotation),
      // transform: Matrix4.rotationY(100 / _rotation),
    );
  }

  Widget _cWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: _animation.value,
      height: _animation.value,
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        "变大",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
