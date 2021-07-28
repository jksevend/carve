import 'dart:io';

import 'package:carve/util/verbose_logger.dart';
import 'package:carve/util/extensions.dart';

abstract class BaseCarver {
  static const String EMPTY_STRING = '';
  static const String UNDERSCORE = '_';

  /// Check if the extracted [filename] from the --name argument matches
  /// dart coding standards
  void validateFilename(final bool verbose, final String filename) {
    final RegExp filenameRegex = RegExp('[a-z_]');
    final bool matches = filenameRegex.hasMatch(filename);
    VerboseLogger.logValidatingFilename(verbose);
    if (!matches) {
      throw ArgumentError(
          'The filename can only consist of alphabetical characters and underscores.');
    }
  }

  /// Formats the extracted [filename]
  ///
  /// First letter needs to be capitalited
  /// All occurences of underscores needs to be replaced with an empty string
  ///
  /// First letter appearing after each underscore also uppercase
  /// Example:
  /// three_named_component -> class ThreeNamedComponent ...
  String formatClassName(final bool verbose, final String filename) {
    String className = filename.capitalize();
    String name = EMPTY_STRING;
    if (className.contains(UNDERSCORE)) {
      /// Build [name] char by char
      for (int i = 0; i < className.length; i++) {
        final String char = className[i];

        if (char == UNDERSCORE) {
          // Capitalize the next index and skip it
          name += className[i + 1].capitalize();
          i++;
        } else {
          // Add normally
          name += char;
        }
      }
      // Finally replace all occurences
      name = name.replaceAll(UNDERSCORE, EMPTY_STRING);
    } else {
      name = className;
    }

    VerboseLogger.logFormattedClassname(verbose, filename, name);
    return name;
  }

  /// Generates a [File] in the lib directory of a flutter app.
  ///
  /// [name] - The name of the file to be generated
  /// [content] - The template code content to write to the file
  /// [directory] - Possible directory or directories to create along with the file
  void generateFile(String name, String content, String directory) {
    new File('lib/' +
            (directory == EMPTY_STRING ? EMPTY_STRING : directory) +
            name +
            '.dart')
        .create(recursive: true)
        .then((File file) {
      file.writeAsStringSync(content);
    });
    VerboseLogger.logGeneratedFile(name, directory);
  }

  /// Extracts possible directories from the name argument into a single string
  ///
  /// [foundPaths] - each directory found prepending the filename
  String extractPossibleDirectories(
      final bool verbose, final List<String> foundPaths) {
    // Build the directory path
    String directory = EMPTY_STRING;
    for (int i = 0; i < foundPaths.length; i++) {
      // Exclude the last one because that is the filename
      if (i != foundPaths.length - 1) {
        directory += foundPaths[i] + '/';
      }
    }

    if (directory == EMPTY_STRING) {
      VerboseLogger.logNoDirectoriesFound(verbose);
    } else {
      VerboseLogger.logExtractedDirectories(verbose, directory);
    }

    return directory;
  }
}
