import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobildovizapp/model/currencymodel.dart';
import 'package:http/http.dart' as http;
import 'package:mobildovizapp/pages/dovizpages/euro.dart';
import 'package:mobildovizapp/pages/dovizpages/dovizhomepage.dart';
import 'package:mobildovizapp/pages/dovizpages/dolar.dart';
import 'package:mobildovizapp/pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobildovizapp/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Döviz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
