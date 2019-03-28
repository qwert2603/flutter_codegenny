import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:data_class/data_class.dart';
import 'package:source_gen/source_gen.dart';

class DataClassGenerator extends GeneratorForAnnotation<DataClass> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final output = StringBuffer();
    final classElement = element as ClassElement;
    final className = "${classElement.name}DataClass";

    final typeCheckerExcludeFromEqual = TypeChecker.fromUrl(
        "package:annotation/src/exclude.dart#ExcludeFromEqual");
    final typeCheckerExcludeFromToString = TypeChecker.fromUrl(
        "package:annotation/src/exclude.dart#ExcludeFromToString");

//    final generatedClass = Class((b) => b
//      ..name = className
//      ..fields = ListBuilder(classElement.fields.map((fe) => Field((b) => b
//        ..modifier = FieldModifier.final$
//        ..name = fe.name
//        ..type = Reference(fe.type.name))))
//      ..constructors = ListBuilder([
//        Constructor((b) => b
//          ..constant = true
//          ..requiredParameters =
//              ListBuilder(classElement.fields.map((fe) => Parameter((b) => b
//                ..name = fe.name
//                ..toThis = true)))),
//      ])
//      ..methods = ListBuilder([
//        Method((b) => b
//          ..name = "operator =="
//          ..returns = Reference("bool")
//          ..requiredParameters = ListBuilder([
//            Parameter((b) => b
//              ..name = "other"
//              ..type = Reference("Object"))
//          ])
//          ..body = Code("return false;"))
//      ]));
//
//    String classString = generatedClass.accept(new DartEmitter()).toString();
//    final dartfmt = new DartFormatter();
//    String output = dartfmt.format(classString);
//
//    return output;

    output.writeln("class $className {");
    classElement.fields.forEach((FieldElement fe) {
      output.writeln("final ${fe.type} ${fe.name};");
    });
    output.writeln();

    output.writeln("const $className({");
    classElement.fields.forEach((FieldElement fe) {
      output.writeln("this.${fe.name},");
    });
    output.writeln("});");
    output.writeln();

    final Iterable<FieldElement> fieldsEqualHashCode = classElement.fields
        .where((FieldElement fe) => fe.metadata
            .where((ElementAnnotation ea) => typeCheckerExcludeFromEqual
                .isExactlyType(ea.computeConstantValue().type))
            .isEmpty);

    output.writeln("@override");
    output.writeln("bool operator ==(Object other) =>");
    output.writeln("identical(this, other) ||");
    output.writeln("other is $className &&");
    output.writeln("runtimeType == other.runtimeType &&");
    output.write(fieldsEqualHashCode
        .map((fe) => "${fe.name} == other.${fe.name}")
        .join(" && "));
    output.writeln(";");
    output.writeln();

    output.writeln("@override");
    output.write("int get hashCode => ");
    output.write(fieldsEqualHashCode
        .map((FieldElement fe) => "${fe.name}.hashCode")
        .join(" ^ "));
    output.writeln(";");
    output.writeln();

    output.writeln("@override");
    output.write("String toString() => '$className{");
    output.write(classElement.fields
        .where((FieldElement fe) => fe.metadata
            .where((ElementAnnotation ea) => typeCheckerExcludeFromToString
                .isExactlyType(ea.computeConstantValue().type))
            .isEmpty)
        .map((fe) => "${fe.name}: \$${fe.name}")
        .join(", "));
    output.writeln("}';");
    output.writeln();

    classElement.fields.forEach((FieldElement fe) {
      output.write(
          "$className replace${_capitalizeFirst(fe.name)}(${fe.type} ${fe.name}) => $className(");
      classElement.fields.forEach((FieldElement p) {
        output.writeln("${p.name} : ${p == fe ? "" : "this."}${p.name},");
      });
      output.writeln(");");
      output.writeln();
    });

    output.writeln("}");

//    print(output);
    return output.toString();
  }

  static String _capitalizeFirst(String s) =>
      "${s[0].toUpperCase()}${s.substring(1)}";
}
