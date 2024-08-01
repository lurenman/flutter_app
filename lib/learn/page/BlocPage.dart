import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/CounterCubit.dart';

/**
 * 感觉Bloc其实就是数据与ui结偶用的
 */
class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  State<BlocPage> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  final _TAG = "BlocPageState";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlocPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('BlocPage'),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            body: BlocBuilder<CounterCubit, int>(
                // buildWhen: (previousState, state) {
                //   // return true/false to determine whether or not
                //   // to rebuild the widget with state
                // },
                builder: (context, state) {
              // return widget here based on BlocA's state
              return Column(
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
                          //这个一定在BlocBuilder才其作用
                          context.read<CounterCubit>().increment();
                        },
                        child: Text(
                          "测试",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("the result : ${state}"),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
