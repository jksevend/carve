import 'package:args/args.dart';
import 'package:carve/core/templates.dart';
import 'package:carve/util/command_type.dart';
import 'package:carve/util/extensions.dart';

class Carver {
  void carveModel(ArgResults argResults) {
    final String capitalizedFilename =
        argResults['name'].toString().capitalize();

    final String code =
        Templates.modelTemplate.replaceAll("{{name}}", capitalizedFilename);

    print(code);
  }

  void carvePage() {}

  void carveStateful() {}

  void carveStateless() {}
}

/// Interface between bin and lib
///
/// [name] specifies the current used command
/// [argResults] are the results of the parsing
void carve({required String name, required ArgResults argResults}) {
  final CommandType type = from(name);
  final Carver carver = Carver();
  switch (type) {
    case CommandType.model:
      return carver.carveModel(argResults);
    default:
      throw UnsupportedError('Unsupported CommandType: ' + type.toString());
  }
}
