import 'package:args/args.dart';
import 'package:carve/common/base_carver.dart';
import 'package:carve/core/templates.dart';
import 'package:carve/util/verbose_logger.dart';

class ModelCarver extends BaseCarver {
  void carveModel(final ArgResults argResults) {
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
        Templates.modelTemplate.replaceAll('{{name}}', className);

    this.generateFile(componentName, code, directoryPrefix);
  }
}
