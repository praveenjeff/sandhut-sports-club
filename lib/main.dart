import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shscweb/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA7rVYC3m3cGZPyyJ1mZYi9l5lUmmnd50k",
          projectId: "sandhut-sports-club",
          messagingSenderId: "754555256742",
          appId: "1:754555256742:web:e96a12a853647672031967",
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SandHut Sports Club',
      home: HomePage(),
    );
  }
}
