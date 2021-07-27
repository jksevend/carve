import 'package:args/command_runner.dart';

abstract class BaseCommand extends Command {
  BaseCommand() {
    argParser.addOption('name',
        abbr: 'n',
        help:
            'Specifies the name of the template to generate. Use / to define a directory aswell. Example: carve model -n models/user');

    argParser.addFlag('verbose',
        abbr: 'v', help: 'More logging output.', defaultsTo: false);
  }
}
