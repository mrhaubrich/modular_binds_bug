import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_binds_bug/src/modules/one/business_logic/dependency_of_module_one.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Module "One"'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Page "One"',
              style: TextStyle(fontSize: 24),
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
                'This will throw an error, because the ExportedDependency is not binded to this module, but, as it is being exported, shouldn\'t it be binded?',
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
