import 'package:flutter/foundation.dart';

class ExportedDependency {
  ExportedDependency() {
    debugPrint('ExportedDependency created');
  }

  void doSomething({
    bool fromDependencyOfModuleOne = false,
  }) {
    if (fromDependencyOfModuleOne) {
      debugPrint(
          'ExportedDependency doing something from DependencyOfModuleOne');
    } else {
      debugPrint('ExportedDependency doing something');
    }
  }
}
