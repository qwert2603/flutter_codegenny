import 'package:data_class/data_class.dart';

part 'point.g.dart';

@dataClass
class Point {
  double x;
  double y;
  @excludeFromEqual
  @excludeFromToString
  @excludeFromToString
  double z;
  String name;
  @ExcludeFromToString()
  List<String> someList;
  @excludeFromToString
  Set<bool> someSet;
}
