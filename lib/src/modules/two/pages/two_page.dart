import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_binds_bug/src/modules/one/business_logic/dependency_of_module_one.dart';
import 'package:modular_binds_bug/src/modules/one/business_logic/exported_dependency.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Module "Two"'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Page "Two"',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final exportedDependency = Modular.get<ExportedDependency>();
                exportedDependency.doSomething();
              },
              child: const Text('Use the ExportedDependency'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                DependencyOfModuleOne dependencyOfModuleOne = Modular.get();
                dependencyOfModuleOne.doSomething();
              },
              child: const Text('Use the Dependency from "One" Module'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This should throw an error, because the DependencyOfModuleOne is not binded to this module',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'But actually, it will not throw an error, even though it should, and it will use the dependency from the "One" module',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
