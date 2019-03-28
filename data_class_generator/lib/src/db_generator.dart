import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:data_class/data_class.dart';
import 'package:source_gen/source_gen.dart';

class DbGenerator extends GeneratorForAnnotation<Dao> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final output = StringBuffer();
    final classElement = element as ClassElement;

    output.write("class ${element.name}Impl implements ${element.name} {");
    output.write('static const SQL_CREATE =');
    output.write("}");

    return output.toString();
  }
}
