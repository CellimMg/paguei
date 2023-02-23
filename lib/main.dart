import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:melembra/presenter/authentication/page/authentication_page.dart';
import 'package:melembra/utils/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocators();

  runApp(const PagueiApp());
}

class PagueiApp extends StatefulWidget {
  const PagueiApp({Key? key}) : super(key: key);

  @override
  State<PagueiApp> createState() => _PagueiAppState();
}

class _PagueiAppState extends State<PagueiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paguei',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationPage(),
    );
  }
}


