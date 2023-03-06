import 'package:get/get.dart';

import '../presentation_logic/{{name.snakeCase()}}_controller.dart';

class {{name.pascalCase()}}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<{{name.pascalCase()}}Controller>(
      () => {{name.pascalCase()}}Controller(),
    );
  }
}
