class VerboseLogger {
  static final VerboseLogger _verboseLogger = VerboseLogger._internal();

  factory VerboseLogger() {
    return _verboseLogger;
  }

  VerboseLogger._internal();

  static void logFoundArgument(final bool verbose, final String argument) {
    if (verbose) {
      print('Found argument: ' + argument);
    }
  }

  static void logExtractedFilename(final bool verbose, final String filename) {
    if (verbose) {
      print('Extracted filename: ' + filename);
    }
  }

  static void logNoDirectoriesFound(final bool verbose) {
    if (verbose) {
      print('No directories found. Default location is lib/ in your project.');
    }
  }

  static void logExtractedDirectories(
      final bool verbose, final String directory) {
    if (verbose) {
      print('Directories found: ' + directory);
    }
  }

  static void logCreatingFileTemplate(
      final bool verbose, final String filename, final String directory) {
    if (verbose) {
      print('Generating content of file ' +
          filename +
          '.dart' +
          ' in ' +
          directory);
    }
  }

  static void logGeneratedFile(final String name, final String directory) {
    print('Successfully created ' + name + '.dart in lib/' + directory);
  }

  static void logValidatingFilename(bool verbose) {
    if (verbose) {
      print('Validating extracted name...');
    }
  }

  static void logFormattedClassname(
      bool verbose, String filename, String className) {
    if (verbose) {
      print('Formatted ' +
          filename +
          ' to ' +
          className +
          ' for naming class identifiers.');
    }
  }
}
