class ObjectClass {
  test() {
    var student = Student.f("factor", 18);
    var student1 = Student.f("factor", 18);
    print(student);
    print(student1);
    print(student1 == student);
    //内部访问
    print(student.school);

    var constClass = ConstClass("const", 100);
    constClass.printLog();
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age) {}
}

class Student extends Person {
  //带_的代表私有变量,可以类、方法
  String _school = "";
  String city = "";

  //Student(super.name, super.age);
  //构造函数可选参数｛｝
  Student(String name, int age, {this.city = "hangzhou"}) : super(name, age);

  //
  Student.cover(String name, int age) : super(name, age) {
    print("命名构造方法");
  }

  //工厂构造方法,有返回值
  factory Student.f(String name, int age) => Student(name, age);

  //可参考https://www.jianshu.com/p/a1d9d2689dbb
  factory Student.f1(String name, int age) {
    return Student(name, age);
  }

  //get方法 实际就是去掉_  一个新的变量name
  String get school => "beihua";

  //set 方法
  set school(String value) {
    _school = value;
  }
}

class Boy extends Person {
  static final Boy _singleton = Boy.internal("boy instance", 18);

  factory Boy() => _singleton;

  Boy.internal(super.name, super.age);
}

/**
 * Constant Constructors
    如果生成类的对象是不会变的，可以定义常量构造函数；
    其中所有实例变量都是 final 类型的，类中不允许有普通变量类型，因此其变量在构造函数完成之后不允许变更；
    变量中不允许有初始值；
    常量构造函数必须用 const 关键词修饰；
    常量构造函数不允许有函数体；
    实例化时需要加 const 否则实例化的对象仍然可以修改变量值
 */
class ConstClass with WithClass {
  final String name;

  final int age;

  const ConstClass(this.name, this.age);

  void test() {}

  @override
  void printLog() {
    print("this is ConstClass printLog");
  }
}
// with 可以理解为使用接口用的可以多继承， dart没有接口
class WithClass {
  void printLog() {
    print("this is printLog");
  }
}
