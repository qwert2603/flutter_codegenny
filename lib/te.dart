import 'package:flutter_codegenny/point.dart';

main() {
  var point1 = PointDataClass(x: 12);
  print(point1);
  print(point1.replaceX(14));
  print(point1 == point1.replaceX(12));
  print(point1 == point1.replaceX(14));
  print(point1.replaceX(14).replaceName("qq"));
}
