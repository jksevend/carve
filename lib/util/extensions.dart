import 'command_type.dart';

/// Parses an String [name] into an [CommandType]
/// throws [Exception] if an invalid string was passed
CommandType from(final String name) {
  CommandType commandType;
  switch (name) {
    case 'model':
      commandType = CommandType.model;
      break;
    case 'page':
      commandType = CommandType.page;
      break;
    case 'stateful':
      commandType = CommandType.stateful;
      break;
    case 'stateless':
      commandType = CommandType.stateless;
      break;
    default:
      throw UnsupportedError('Invalid command name.');
  }

  return commandType;
}

extension StringExtension on String {
  /// Needed for capitalizing the the class and Constructor names
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// If the --name input is like 'models/common/User' or 'User' we need
  /// to make the first letter lowercase for generating the file
  String makeFirstCharLowerCase() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }
}
