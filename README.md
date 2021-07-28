# Carve

This package aims to provide easy support to generate Flutter pages or widgets as well as simple model classes. In the future you will be able to also create simple layout trees while generating your page or widget.

## Info
**It is important that you are in the current working directory of your flutter/dart project while performing a ```carve``` command because currently it is hardcoded into the package to create generate all subfolders/subfiles to the ```lib/``` directory of your project.**
Example:
If you created a flutter project with name `example` make sure the current working directory is `/example` 

Also this package tries to stay put with file and folder conventions. That's why the ```-n``` | ```--name``` command only allows for lowercase alphabetical characters aswell as one or more underscores.

For more information see https://dart.dev/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores

## Getting started
Since this package is not dependant on Flutter itself you can easily install it by typing in the following command on a terminal.
```
dart pub global activate carve
```

## Usage

When using the ```-n``` | ```--name```option you can specify an output directory aswell. Use ```/``` within the argument to create this folder if it doesnt exist or add it to the folder if it exists.
For example:
```
-n models/common/post
```
Will create the folder ```models``` and ```common``` if they do not exist yet and generate ```post.dart``` in the ```common``` directory


## Creating a model
```
carve model -n models/auth_user
```

will result in the following template being generated:
```
class AuthUser {
  // TODO: implement variables
  AuthUser();
}
```

## Creating a page
```
carve page -n views/login_page
```

will result in the following template being generated:
```
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('LoginPage'),
      ),
      body: const Center(
        child: Text('LoginPage'),
      ),
    );
  }
}
```

## Creating a stateful widget
```
carve stateful -n widgets/custom_button
```

will result in the following template being generated:
```
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: const Text('CustomButton'),
    );
  }
}
```

## Creating a stateless widget
```
carve stateless -n widgets/test
```

will result in the following template being generated:
```
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: const Text('Test'),
    );
  }
}
```

You can also find these generated examples in the `example` folder in the Github repository.


## Future Updates
Currently the plan is to add support for
* adding a new option to be able to generate simple widget trees when generating pages or widgets
* adding a new option to the model command to generate simple ```toJson``` and ```fromJson``` methods
 
## Bugs, Errors etc.
If you find any weird behaviour, bugs or errors please let me know.