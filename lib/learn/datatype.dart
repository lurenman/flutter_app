import 'objectClass.dart';

void main() {
  var datatype = Datatype();
  // datatype.test();
  //datatype.test1();
  ObjectClass().test();
}

class Datatype {
  void test() {
    int a = 123;
    print("the int a ${a}");
    double b = 2.134;
    print("the double b $b");
    //int he  double 的父类
    num n = 2;
    print("the num n $n");
    //和kt一样啊
    var v = "haha";
    print("the var v $v");
    //动态数据类型
    dynamic dy = 1;
    print("the dynamic dy $dy");
    //可以改变类型
    dy = "hello";
    print("the dynamic dy $dy");
    //dy.foo(); 可以调用不存在的方法，run会崩
    //不用强转
    Object oj = "lufei";
    print("the Object oj $oj");
    //list 的相关操作
    List lt = [];
    print("the List lt $lt");
    //可添加任意元素和 groovy好像啊
    List lt1 = [1, 2, 3, "haha"];
    print("the List lt1 $lt1");
    lt1.add("add");
    print("the List lt1 add $lt1");
    //就是闭包，它是这种形式和groovy参数位置不一样，看它方法里可以这么写
    lt1.forEach((element) {
      print("the lt1.forEach $element");
    });

    Map map = {'name': "lu", 'age': 18};
    print('the map $map');

    Map map1 = map.map((key, value) {
      return MapEntry(value, key);
    });
    //这种闭包里可以这种直接=>代表直接返回
    print('the map1 $map1');
    Map map2 = map.map((key, value) => MapEntry(value, key));
    print('the map2 $map2');
    print('the map2 key 18 ${map2[18]}');
    //map2[18]="ddd";
  }

  void test1() {
    List? list;
    print(list?.length);
    //??设置默认值 kt是 :
    print(list?.length ?? -2);
    list = [1, 2, 3];
    print(list.length);
  }
}
