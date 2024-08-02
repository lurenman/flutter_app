import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

class CityPickersPage extends StatefulWidget {
  const CityPickersPage({Key? key}) : super(key: key);

  @override
  State<CityPickersPage> createState() => _CityPickersPageState();
}

class _CityPickersPageState extends State<CityPickersPage> {
  final _TAG = "CityPickersPageState";
  Result? _selectedRegion;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CityPickersPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CityPickersPage'),
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
                  onPressed: () async {
                    Result? resultRegion = await CityPickers.showCityPicker(
                        context: context,
                        locationCode: ((_selectedRegion == null ||
                                _selectedRegion!.areaId == null)
                            ? '110000'
                            : _selectedRegion!.areaId!));

                    if (mounted)
                      setState(() {
                        _selectedRegion = resultRegion;
                      });
                  },
                  child: Text(
                    "测试",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("the result : ${_selectedRegion?.toString()}"),
            )
          ],
        ),
      ),
    );
  }
}
