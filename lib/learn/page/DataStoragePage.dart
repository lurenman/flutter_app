import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/learn/page/model/CommonModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 数据存储相关
 * http请求json：https://www.devio.org/io/flutter_app/json/home_page.json
 * https://www.devio.org/io/flutter_app/json/test_common_model.json
 *https://javiercbk.github.io/json_to_dart/   json转dart工具
 */
class DataStoragePage extends StatefulWidget {
  const DataStoragePage({Key? key}) : super(key: key);

  @override
  _DataStoragePageState createState() => _DataStoragePageState();
}

class _DataStoragePageState extends State<DataStoragePage> {
  final TAG = "DataStoragePageState";
  static const String _key = "key";
  var url =
      Uri.https('www.devio.org', '/io/flutter_app/json/test_common_model.json');
  String resultStr = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataStoragePage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataStoragePage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(18, 30, 18, 0),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      var result = fetchGet();
                      // var result = fetchHttpClient();
                      result.then((CommonModel value) {
                        setState(() {
                          resultStr = value.toString();
                          print(TAG + " ${resultStr}");
                        });
                      });
                    },
                    child: Text(
                      "获取网络数据",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18, 20, 18, 0),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      prefs.setString(_key, "haha");
                    },
                    child: Text(
                      "sp设置值",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18, 20, 18, 0),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      var value = prefs.getString(_key);
                      // value=null;
                      setState(() {
                        resultStr = value!;
                      });
                    },
                    child: Text(
                      "sp读取值",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  resultStr,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<CommonModel> fetchGet() async {
    //final 相当于kt  val
    final response = await http.get(url);
    final result = json.decode(utf8.decode(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  /**
   * 用Client如果多次请求可以选，防止连接关闭消耗资源
   */
  Future<CommonModel> fetchHttpClient() async {
    var client = http.Client();
    try {
      var response = await http.get(url);
      final result = json.decode(utf8.decode(response.bodyBytes));
      return CommonModel.fromJson(result);
    } finally {
      client.close();
    }
  }
}
