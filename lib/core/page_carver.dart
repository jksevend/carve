import 'package:args/args.dart';
import 'package:carve/common/base_carver.dart';
import 'package:carve/util/verbose_logger.dart';

import 'templates.dart';

class PageCarver extends BaseCarver {
  void carvePage(final ArgResults argResults) {
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
        Templates.pageTemplate.replaceAll('{{name}}', className);

    this.generateFile(componentName, code, directoryPrefix);
  }
}
