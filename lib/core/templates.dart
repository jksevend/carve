class Templates {
  static String get modelTemplate => '''class {{name}} {
  // TODO: implement variables
  {{name}}();
}''';

  static String get statefulTemplate =>
      '''import 'package:flutter/material.dart';

class {{name}} extends StatefulWidget {
  const {{name}}({Key? key}) : super(key: key);

  @override
  _{{name}}State createState() => _{{name}}State();
}

class _{{name}}State extends State<{{name}}> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: const Text('{{name}}'),
    );
  }
}''';

  static String get statelessTemplate =>
      '''import 'package:flutter/material.dart';

class {{name}} extends StatelessWidget {
  const {{name}}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: const Text('{{name}}'),
    );
  }
}''';

  static String get pageTemplate => '''import 'package:flutter/material.dart';

class {{name}} extends StatefulWidget {
  const {{name}}({Key? key}) : super(key: key);

  @override
  _{{name}}State createState() => _{{name}}State();
}

class _{{name}}State extends State<{{name}}> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('{{name}}'),
      ),
      body: const Center(
        child: Text('{{name}}'),
      ),
    );
  }
}''';
}
