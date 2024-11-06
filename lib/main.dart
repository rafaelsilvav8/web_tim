import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

Future<void> main() async {
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
                labelText: 'Teste digite algo',
              ),
              onSubmitted: (text) {
                createTextBoxAndChange("textbox_01", "text_field_submitted", "01");
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key("btn_01"),
              child: const Text("Teste clique"),
              onPressed: () {
                createButtonAndClick("btn_01", "flutter_button_clicked", "02");
              },
            ),
          ],
        ),
      ),
    );
  }
}

void createButtonAndClick(String buttonId, String eventName, String value) {
  js.context.callMethod('decibelInsight', ['sendTrackedEvent', eventName, value]);  
}

void createTextBoxAndChange(String inputId, String eventName, String newValue) {
  js.context.callMethod('decibelInsight', ['sendTrackedEvent', eventName, newValue]);
}
