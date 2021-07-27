import 'command_type.dart';

/// Parses an String [name] into an [CommandType]
/// throws [Exception] if an invalid string was passed
CommandType from(final String name) {
  CommandType commandType;
  switch (name) {
    case 'model':
      commandType = CommandType.model;
      break;
    default:
      throw Exception('Invalid command name.');
  }

  return commandType;
}

/// Needed for capitalizing the the class and Constructor names
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
