import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/one/');
              },
              child: const Text('Module "One"'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/two/');
              },
              child: const Text('Module "Two"'),
            ),
          ],
        ),
      ),
    );
  }
}
