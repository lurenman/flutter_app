import 'package:flutter/material.dart';

class StatefullWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulGroupState();
  }
}

class _StatefulGroupState extends State<StatefullWidgetPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: '首页',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                label: '列表')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? Text("首页")
            : RefreshIndicator(
                onRefresh: () async {
                  //模拟网络请求
                  await Future.delayed(Duration(milliseconds: 2000));
                  //结束刷新
                  return Future.value(true);
                },
                child: ListView(
                  children: [
                    Image.network(
                      'http://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "please",
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    ),
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(color: Colors.lightBlueAccent),
                      child: PageView(
                        children: [
                          _item('Page1', Colors.deepPurple),
                          _item('Page2', Colors.green),
                          _item('Page3', Colors.red)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: ClipOval(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                              'https://img-blog.csdnimg.cn/20210301145757946.png'),
                        ),
                        //clipper: _MyClipper(),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRect(
                        child: Opacity(
                          opacity: 0.6, //60%透明度
                          child: Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      //PhysicalModel 可以设置z轴和阴影
                      child: PhysicalModel(
                        shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        child: PageView(
                          children: [
                            _item('Page1', Colors.deepPurple),
                            _item('Page2', Colors.green),
                            _item('Page3', Colors.red)
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        //用法与SizedBox类似，只不过FractionallySizedBox的宽高是百分比大小，widthFactor，heightFactor参数就是相对于父控件的比例。注意设置FractionallySizedBox宽高后，其子组件设置的宽高将不起作用
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.greenAccent),
                            child: Text('宽度撑满'),
                          ),
                        ),
                      ],
                    ),
                    //Android端FramLayout布局 叠加布局
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 36,
                              height: 36,
                            ))
                      ],
                    ),
                    Wrap(
                      spacing: 8, //水平间距
                      runSpacing: 6, //垂直间距
                      children: [
                        _chip('Flutter'),
                        _chip('进阶'),
                        _chip('实战'),
                        _chip('携程'),
                        _chip('App'),
                      ],
                    ),
                    //对比wrap 看直接显示报错了
                    Row(
                      children: [
                        _chip('Flutter'),
                        _chip('进阶'),
                        _chip('实战'),
                        _chip('携程'),
                        _chip('App'),
                      ],
                    ),
                    Row(
                      children: [
                        Image.network(
                          'https://img-blog.csdnimg.cn/20210301145757946.png',
                          width: 100,
                          height: 100,
                        ),
                        Image.network(
                          'https://img-blog.csdnimg.cn/20210301145757946.png',
                          width: 100,
                          height: 100,
                        ),
                        Expanded(
                            flex: 2, //由于其它组件弹性系数默认是1，中间组件设置了弹性系数2，因此宽度是其它组件的两倍
                            child: Image.network(
                              'https://img-blog.csdnimg.cn/20210301145757946.png',
                              width: 100,
                              //此时设置with已无效
                              height: 100,
                              //参考：https://blog.csdn.net/tianhongfan10106/article/details/120940320
                              fit: BoxFit.cover, //相当于centerCrop
                            )),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    Future.delayed(Duration(seconds: 3));
    return null;
  }

  //返回值可以省略
  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0, 0, 50, 50);
    // return new Rect.fromLTRB(10.0, 10.0, size.width - 10.0, size.height - 10.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
