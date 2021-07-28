import 'package:carve/carve.dart';

import '../core/build_command.dart';

///
class StatelessCommand extends BuildCommand {
  StatelessCommand() : super();

  @override
  String get description => 'Creates a basic flutter StatelessWidget.';

  @override
  String get name => 'stateless';

  @override
  void run() {
    carve(name: name, argResults: argResults!);
  }
}
