import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(const MyApp());
  SemanticsBinding.instance.ensureSemantics();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alerta no Flutter Web")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: const Key("textbox_01"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite algo',
              ),
              onSubmitted: (text) {
                // ignore: avoid_print
                print('Texto digitado: $text');
              },
            ),
            const SizedBox(
                height: 20), // Espaçamento entre o TextField e o botão
            ElevatedButton(
              key: const Key("btn_01"),
              child: Semantics(child: const Text("Log event")),
              onPressed: () {
                // ignore: avoid_print
                print('Botão pressionado');
              },
            ),
          ],
        ),
      ),
    );
  }
}
