import 'package:carve/carve.dart';

import '../core/build_command.dart';

///
class PageCommand extends BuildCommand {
  @override
  String get description =>
      'Creates a basic flutter page containing a scaffold.';

  @override
  String get name => 'page';

  @override
  void run() {
    carve(name: name, argResults: argResults!);
  }
}
