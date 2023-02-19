import 'package:flutter/material.dart';
import 'package:mark_shop/Learning/learning-screen.dart';
import '/Pages/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mark Shop',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
