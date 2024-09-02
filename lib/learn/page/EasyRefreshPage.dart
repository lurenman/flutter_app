import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_refresh/easy_refresh.dart';

class EasyRefreshPage extends StatefulWidget {
  const EasyRefreshPage({Key? key}) : super(key: key);

  @override
  State<EasyRefreshPage> createState() => _EasyRefreshPageState();
}

class _EasyRefreshPageState extends State<EasyRefreshPage> {
  final _TAG = "EasyRefreshPage";
  int _count = 10;
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    EasyRefresh.defaultHeaderBuilder = () => ClassicHeader(
        dragText: '下拉可以刷新',
        armedText: '松开立即刷新',
        readyText: '正在刷新数据中...',
        processingText: '正在刷新数据中...',
        processedText: '下拉刷新成功',
        noMoreText: '无数据',
        failedText: '下拉刷新失败',
        messageText: '最后更新时间 %T',
        showMessage: false);
    EasyRefresh.defaultFooterBuilder = () => ClassicFooter(
        dragText: '上拉可以加载更多',
        armedText: '松开立即加载更多',
        readyText: '正在加载更多数据...',
        processingText: '正在加载更多数据...',
        processedText: '上拉加载成功',
        noMoreText: '没有更多了',
        failedText: '上拉加载失败',
        messageText: '最后更新时间 %T',
        showMessage: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyRefreshPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyRefreshPage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: EasyRefresh(
          controller: _controller,
          header: EasyRefresh.defaultHeaderBuilder(),
          footer: EasyRefresh.defaultFooterBuilder(),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            if (!mounted) {
              return;
            }
            setState(() {
              _count = 10;
            });
            _controller.finishRefresh();
            _controller.resetFooter();
          },
          onLoad: () async {
            await Future.delayed(const Duration(seconds: 1));
            if (!mounted) {
              return;
            }
            setState(() {
              _count += 5;
            });
            _controller.finishLoad(_count >= 20
                ? IndicatorResult.noMore
                : IndicatorResult.success);
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  child: Text('${index + 1}'),
                ),
              );
            },
            itemCount: _count,
          ),
        ),
      ),
    );
  }
}
