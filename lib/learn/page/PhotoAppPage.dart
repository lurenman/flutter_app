import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoAppPage extends StatefulWidget {
  const PhotoAppPage({Key? key}) : super(key: key);

  @override
  _PhotoAppPageState createState() => _PhotoAppPageState();
}

class _PhotoAppPageState extends State<PhotoAppPage> {
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var xFile = await _picker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    if (xFile != null) {
      File image = File(xFile.path);
      if (image != null) {
        setState(() {
          _images.add(image);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoAppPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PhotoAppPage"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _genImages(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: '选择图片',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _genImages() {
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            //圆角效果
            borderRadius: BorderRadius.circular(5),
            child: Image.file(file, width: 120, height: 90, fit: BoxFit.fill),
          ),
          Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  //圆角删除按钮
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      );
    }).toList();
  }
}
