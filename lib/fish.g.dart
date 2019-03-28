// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

class FishDataClass {
  final int i;
  final String s;
  final Fish f;
  final List<String> list;
  final Map<int, double> map;

  const FishDataClass({
    this.i,
    this.s,
    this.f,
    this.list,
    this.map,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FishDataClass &&
          runtimeType == other.runtimeType &&
          i == other.i &&
          s == other.s &&
          f == other.f &&
          list == other.list &&
          map == other.map;

  @override
  int get hashCode =>
      i.hashCode ^ s.hashCode ^ f.hashCode ^ list.hashCode ^ map.hashCode;

  @override
  String toString() =>
      'FishDataClass{i: $i, s: $s, f: $f, list: $list, map: $map}';

  FishDataClass replaceI(int i) => FishDataClass(
        i: i,
        s: this.s,
        f: this.f,
        list: this.list,
        map: this.map,
      );

  FishDataClass replaceS(String s) => FishDataClass(
        i: this.i,
        s: s,
        f: this.f,
        list: this.list,
        map: this.map,
      );

  FishDataClass replaceF(Fish f) => FishDataClass(
        i: this.i,
        s: this.s,
        f: f,
        list: this.list,
        map: this.map,
      );

  FishDataClass replaceList(List<String> list) => FishDataClass(
        i: this.i,
        s: this.s,
        f: this.f,
        list: list,
        map: this.map,
      );

  FishDataClass replaceMap(Map<int, double> map) => FishDataClass(
        i: this.i,
        s: this.s,
        f: this.f,
        list: this.list,
        map: map,
      );
}
