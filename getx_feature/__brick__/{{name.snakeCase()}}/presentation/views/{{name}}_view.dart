import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../presentation_logic/{{name.snakeCase()}}_controller.dart';

class {{name.pascalCase()}}View extends GetView<{{name.pascalCase()}}Controller> {
  const {{name.pascalCase()}}View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${{{name.pascalCase()}}View}'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
