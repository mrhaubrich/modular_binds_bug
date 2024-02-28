import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_binds_bug/src/modules/one/one_module.dart';
import 'package:modular_binds_bug/src/modules/two/pages/two_page.dart';

class TwoModule extends Module {
  @override
  List<Module> get imports => [
        // this should import ONLY the exported binds from OneModule
        // but it's importing the binds from OneModule too
        OneModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const TwoPage());
  }
}
