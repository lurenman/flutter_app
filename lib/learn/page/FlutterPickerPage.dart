import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';

const PickerData = '''
[
    {
        "a": [
            {
                "a1": [
                    1,
                    2,
                    3,
                    4
                ]
            },
            {
                "a2": [
                    5,
                    6,
                    7,
                    8
                ]
            },
            {
                "a3": [
                    9,
                    10,
                    11,
                    12
                ]
            }
        ]
    },
    {
        "b": [
            {
                "b1": [
                    11,
                    22,
                    33,
                    44
                ]
            },
            {
                "b2": [
                    55,
                    66,
                    77,
                    88
                ]
            },
            {
                "b3": [
                    99,
                    1010,
                    1111,
                    1212
                ]
            }
        ]
    },
    {
        "c": [
            {
                "c1": [
                    "a",
                    "b",
                    "c"
                ]
            },
            {
                "c2": [
                    "aa",
                    "bb",
                    "cc"
                ]
            },
            {
                "c3": [
                    "aaa",
                    "bbb",
                    "ccc"
                ]
            }
        ]
    }
]
    ''';
const PickerData2 = '''
[
    [
        1,
        2,
        3,
        4
    ],
    [
        11,
        22,
        33,
        44
    ],
    [
        "aaa",
        "bbb",
        "ccc"
    ]
]
    ''';
final String _fontFamily = Platform.isWindows ? "Roboto" : "";

class FlutterPickerPage extends StatefulWidget {
  const FlutterPickerPage({Key? key}) : super(key: key);

  @override
  State<FlutterPickerPage> createState() => _FlutterPickerPageState();
}

class _FlutterPickerPageState extends State<FlutterPickerPage> {
  final _TAG = "FlutterPickerPage";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestPluginPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TestPluginPage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
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
                    //showPicker(context);
                    showPickerModal(context);
                  },
                  child: Text(
                    "showPickerModal",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18, 30, 18, 0),
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    showPickerArray(context);
                  },
                  child: Text(
                    "showPickerArray",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18, 30, 18, 0),
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    showPickerNumber(context);
                  },
                  child: Text(
                    "showPickerNumber",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  showPicker(BuildContext context) {
    Picker picker = new Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: new JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.showModal(this.context);
  }

  showPickerModal(BuildContext context) {
    new Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: new JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showModal(this.context); //_scaffoldKey.currentState);
  }

  showPickerArray(BuildContext context) {
    new Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: new JsonDecoder().convert(PickerData2), isArray: true),
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 0, end: 999),
          NumberPickerColumn(begin: 100, end: 200),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }
}
