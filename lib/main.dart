import 'package:flutter/material.dart';
import 'package:mark_shop/Learning/learning-screen.dart';
import 'package:mark_shop/Pages/home.dart';
import 'package:mark_shop/provider/adminMode.dart';
import 'package:mark_shop/provider/modelHub.dart';
import '/Pages/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(create: (context) => ModelHud()),
        ChangeNotifierProvider<AdminMode>(create: (context) => AdminMode())
      ],
      child: MaterialApp(
        title: 'Mark Shop',
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
