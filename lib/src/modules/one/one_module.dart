import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_binds_bug/src/modules/one/business_logic/dependency_of_module_one.dart';
import 'package:modular_binds_bug/src/modules/one/business_logic/exported_dependency.dart';
import 'package:modular_binds_bug/src/modules/one/pages/one_page.dart';

/// Note that when we import this module
/// it prints the following:
/// ```
/// OneModule.exportedBinds
/// OneModule.binds
/// ```
/// This means that the `exportedBinds` method is being called
/// and the `binds` method is being called too
/// but the `exportedBinds` method should be the only one being called
/// since we are IMPORTING this module, not INITIALIZING it as a module
///
/// When we INITIALIZE this module, it prints the following:
/// ```
/// OneModule.binds
/// ```
/// This means that the `binds` method is being called
/// but the `exportedBinds` method is not being called.
///
/// This is a bug, because the `exportedBinds` method should be called when we import this module,
/// so we can maintain modularity and avoid conflicts between modules.
class OneModule extends Module {
  @override
  void exportedBinds(Injector i) {
    debugPrint('OneModule.exportedBinds');
    // this should be a dependency shared with other modules that import this module
    // but it's not binded to this module
    i.add(ExportedDependency.new);
  }

  @override
  void binds(Injector i) {
    debugPrint('OneModule.binds');
    // this should be a dependency exclusive to this module
    // but it's being shared with other modules that import this module
    i.add(DependencyOfModuleOne.new);

    // if we add this, without removing from the exportedBinds method
    // it will conflict with the other ExportedDependency
    // i.add(ExportedDependency.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const OnePage());
  }
}
