

import 'package:my_flutter_app/pages/file.dart';

void main() {
  // 在 main 函数中实例化 Person 对象
  Person person1 = Person(name: 'tom', age: 14);

  // 打印 person1 的名字
  print(person1.name); // 输出: tom
  person1.name = "jack";
  print(person1.male );
  person1.male = true;
  print(person1.male );
}
