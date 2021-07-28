import 'package:args/command_runner.dart';

abstract class BaseCommand extends Command {
  BaseCommand() {
    argParser.addFlag('verbose',
        abbr: 'v', help: 'More logging output.', defaultsTo: false);
    argParser.addOption('name',
        abbr: 'n',
        help: 'Specifies the name of the template to generate.\n' +
            'Use / to define a directory aswell. Example: carve model -n models/user\n' +
            'Will create the directories if they do not exist yet or add to them if they exist.');
  }
}
