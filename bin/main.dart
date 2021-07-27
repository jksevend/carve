import 'package:args/command_runner.dart';

import 'common/model_command.dart';
import 'common/page_command.dart';
import 'common/stateful_command.dart';
import 'common/stateless_command.dart';

void main(List<String> arguments) {
  // Define the runner
  final CommandRunner commandRunner =
      CommandRunner('carve', 'A Flutter file template generator tool.')

        // Add main commands
        ..addCommand(ModelCommand())
        ..addCommand(PageCommand())
        ..addCommand(StatefulCommand())
        ..addCommand(StatelessCommand());
  // Run
  commandRunner.run(arguments);
}
