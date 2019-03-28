import 'package:data_class/data_class.dart';

part 'fish.g.dart';

@DataClass()
class Fish {
  int i;
  String s;
  Fish f;
  @excludeFromEqual
  List<String> list;
  @ExcludeFromEqual()
  Map<int, double> map;
}

// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs
