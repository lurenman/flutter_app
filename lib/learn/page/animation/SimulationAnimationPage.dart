import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/**
 * 参考：https://blog.csdn.net/Calvin_zhou/article/details/116306351
 * 物理动画：不确定结束值，根据起始条件(如初速度，摩檫力，初始位置进行动画模拟)
 */
class SimulationAnimationPage extends StatefulWidget {
  const SimulationAnimationPage({Key? key}) : super(key: key);

  @override
  _SimulationAnimationPageState createState() =>
      _SimulationAnimationPageState();
}

class _SimulationAnimationPageState extends State<SimulationAnimationPage> {
  double value = 0;

  //position 距离  velocity 速度
  var clampSimulation = ClampingScrollSimulation(position: 200, velocity: 1);
  late Ticker tic;

  @override
  void initState() {
    super.initState();
    tic = Ticker((elapsed) {
      if (!clampSimulation.isDone(elapsed.inMicroseconds / 1000)) {
        setState(() {
          value = clampSimulation.x(elapsed.inMicroseconds / 1000);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimulationAnimationPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SimulationAnimationPage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              if (!tic.isActive) {
                tic.start();
              }
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              margin: EdgeInsets.only(left: value),
              alignment: Alignment.center,
              child: Text(
                '点我开始动画',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tic.dispose();
    super.dispose();
  }
}
