import 'package:carve/carve.dart';

import '../core/build_command.dart';

///
class StatefulCommand extends BuildCommand {
  StatefulCommand() : super();

  @override
  String get description => 'Creates a basic flutter StatefulWidget.';

  @override
  String get name => 'stateful';

  @override
  void run() {
    carve(name: name, argResults: argResults!);
  }
}
