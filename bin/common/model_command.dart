import 'package:carve/carve.dart';

import '../core/base_command.dart';

///
class ModelCommand extends BaseCommand {
  @override
  String get description => 'Creates a basic dart model class.';

  @override
  String get name => 'model';

  ModelCommand() {
    argParser.addFlag('json',
        abbr: 'j',
        help:
            'Wheter to create fromJson() and toJson() methods for the model.');
  }

  @override
  void run() {
    carve(name: name, argResults: argResults!);
  }
}
