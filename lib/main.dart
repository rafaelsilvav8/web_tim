import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: MyHomePage(analytics: analytics),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  final FirebaseAnalytics analytics;

  MyHomePage({required this.analytics});

  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, Object>{
        'string': 'flutter',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
      },
    );
  }


  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção"),
          content: Text("Este é um alerta no Flutter Web!"),
          actions: <Widget>[
            TextButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o alerta
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alerta no Flutter Web")),
      body: Center(
        child: ElevatedButton(
          child: Text("Log event"),
          onPressed: _sendAnalyticsEvent         
        ),
      ),
    );
  }
}
