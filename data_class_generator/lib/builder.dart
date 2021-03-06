import 'package:data_class_generator/src/data_class_generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder dataClass(BuilderOptions options) =>
    SharedPartBuilder([DataClassGenerator()], 'data_class');