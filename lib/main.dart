import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'firebase_options.dart';
import 'package:flutter/semantics.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  SemanticsBinding.instance.ensureSemantics();
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

  Future<void> _sendAnalyticsEvent(String event, String elemnt) async {
    await analytics.logEvent(
      name: event,
      parameters: <String, Object>{
        'click': elemnt,
        'timestamp': DateTime.now().toUtc().toString(),
        'platform': 'web',
        'language': 'pt-BR',
        'app_version': '1.0.0',
        'os_version': '10.0.0',        
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alerta no Flutter Web")),
      body: Center(
        child: ElevatedButton(
          child: Semantics(child: const Text("Log event")),
          onPressed: () {
                _sendAnalyticsEvent("click_btn_alert", "button_alerta_flutter_web");
          },         
        ),
      ),
    );
  }
}
