# flutter_codegenny

Code generation in Dart. Generate data classes.

## Example

Create class-template

```dart
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
```

... and data class will be generated.

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

class PointDataClass {
  final double x;
  final double y;
  final double z;
  final String name;
  final List<String> someList;
  final Set<bool> someSet;

  const PointDataClass({
    this.x,
    this.y,
    this.z,
    this.name,
    this.someList,
    this.someSet,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointDataClass &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y &&
          name == other.name &&
          someList == other.someList &&
          someSet == other.someSet;

  @override
  int get hashCode =>
      x.hashCode ^
      y.hashCode ^
      name.hashCode ^
      someList.hashCode ^
      someSet.hashCode;

  @override
  String toString() => 'PointDataClass{x: $x, y: $y, name: $name}';

  PointDataClass replaceX(double x) => PointDataClass(
        x: x,
        y: this.y,
        z: this.z,
        name: this.name,
        someList: this.someList,
        someSet: this.someSet,
      );

  PointDataClass replaceY(double y) => PointDataClass(
        x: this.x,
        y: y,
        z: this.z,
        name: this.name,
        someList: this.someList,
        someSet: this.someSet,
      );

  PointDataClass replaceZ(double z) => PointDataClass(
        x: this.x,
        y: this.y,
        z: z,
        name: this.name,
        someList: this.someList,
        someSet: this.someSet,
      );

  PointDataClass replaceName(String name) => PointDataClass(
        x: this.x,
        y: this.y,
        z: this.z,
        name: name,
        someList: this.someList,
        someSet: this.someSet,
      );

  PointDataClass replaceSomeList(List<String> someList) => PointDataClass(
        x: this.x,
        y: this.y,
        z: this.z,
        name: this.name,
        someList: someList,
        someSet: this.someSet,
      );

  PointDataClass replaceSomeSet(Set<bool> someSet) => PointDataClass(
        x: this.x,
        y: this.y,
        z: this.z,
        name: this.name,
        someList: this.someList,
        someSet: someSet,
      );
}

```
