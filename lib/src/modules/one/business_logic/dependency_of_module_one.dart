import 'package:flutter/material.dart';
import 'package:modular_binds_bug/src/modules/one/business_logic/exported_dependency.dart';

class DependencyOfModuleOne {
  final ExportedDependency exportedDependency;

  DependencyOfModuleOne(this.exportedDependency) {
    debugPrint('DependencyOfModuleOne created');
  }

  void doSomething() {
    debugPrint('DependencyOfModuleOne doing something');

    exportedDependency.doSomething(fromDependencyOfModuleOne: true);
  }
}
