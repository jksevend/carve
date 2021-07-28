export 'package:carve/carve.dart';

import 'package:args/args.dart';
import 'package:carve/core/page_carver.dart';
import 'package:carve/core/stateful_carver.dart';
import 'package:carve/core/stateless_carver.dart';

import 'core/model_carver.dart';
import 'util/command_type.dart';
import 'util/extensions.dart';

/// This method is the main api
/// It is called from the bin directory, which is used to define all needed commands
///
/// This method calls a different instance Carvers depending on the passed command
/// [name] is the name of the command
/// [argResults] are the results of the invocation of this command with defined options, flags, etc.
void carve({required String name, required ArgResults argResults}) {
  final CommandType type = from(name);
  switch (type) {
    case CommandType.model:
      final ModelCarver modelCarver = ModelCarver();
      modelCarver.carveModel(argResults);
      break;
    case CommandType.page:
      final PageCarver pageCarver = PageCarver();
      pageCarver.carvePage(argResults);
      break;
    case CommandType.stateful:
      final StatefulCarver statefulCarver = StatefulCarver();
      statefulCarver.carveStateful(argResults);
      break;
    case CommandType.stateless:
      final StatelessCarver statelessCarver = StatelessCarver();
      statelessCarver.carveStateless(argResults);
      break;
    default:
      throw UnsupportedError('Unsupported CommandType: ' + type.toString());
  }
}
