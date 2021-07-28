import 'package:args/args.dart';
import 'package:carve/common/base_carver.dart';
import 'package:carve/util/verbose_logger.dart';

import 'templates.dart';

class StatelessCarver extends BaseCarver {
  void carveStateless(final ArgResults argResults) {
    final bool verbose = argResults['verbose'];
    final String nameArgument = argResults['name'];
    VerboseLogger.logFoundArgument(verbose, nameArgument);

    final List<String> extractedNames = nameArgument.split('/');
    String componentName = extractedNames.last;

    this.validateFilename(verbose, componentName);

    final String directoryPrefix =
        this.extractPossibleDirectories(verbose, extractedNames);

    final String className = this.formatClassName(verbose, componentName);

    VerboseLogger.logCreatingFileTemplate(
        verbose, componentName, directoryPrefix);
    final String code =
        Templates.statelessTemplate.replaceAll('{{name}}', className);

    this.generateFile(componentName, code, directoryPrefix);
  }
}
