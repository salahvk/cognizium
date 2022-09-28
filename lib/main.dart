import 'package:cognizium/Screens/login_check.dart';
import 'package:cognizium/components/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBgKmNdnBrwTEdg4fU21LKZhivSgfAuNRo",
            authDomain: "cogniziumsh.firebaseapp.com",
            projectId: "cogniziumsh",
            storageBucket: "cogniziumsh.appspot.com",
            messagingSenderId: "449796506333",
            appId: "1:449796506333:web:c301b89be99413e95fd134",
            measurementId: "G-22V59F81W3"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cognizium',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(context).copyWith(useMaterial3: true),
      home: const LoginCheck(),
    );
  }
}
