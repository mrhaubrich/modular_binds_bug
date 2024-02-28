import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_binds_bug/src/home_page.dart';
import 'package:modular_binds_bug/src/modules/one/one_module.dart';
import 'package:modular_binds_bug/src/modules/two/two_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    r.module('/one', module: OneModule());
    r.module('/two', module: TwoModule());
  }
}
