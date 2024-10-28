import 'package:authentication_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print(dotenv.env['GOOGLE_API_KEY']);
    super.initState();
  }

  void initState1() {
    print(dotenv.env['WEB_API_KEY']);
    print(dotenv.env['WEB_APP_ID']);

    super.initState();
  }

  void initState2() {
    print(dotenv.env['ANDROID_API_KEY']);
    print(dotenv.env['ANDROID_APP_ID']);

    super.initState();
  }

  void initState3() {
    print(dotenv.env['IOS_API_KEY']);
    print(dotenv.env['IOS_APP_ID']);
    super.initState();
  }

  void initState4() {
    print(dotenv.env['MACOS_API_KEY']);
    print(dotenv.env['MACOS_APP_ID']);
    super.initState();
  }

  void initState5() {
    print(dotenv.env['WINDOWS_API_KEY']);
    print(dotenv.env['WINDOWS_APP_ID']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "RobotoSlab",
        useMaterial3: true,
      ),
      home: SignUpScreen(),
    );
  }
}
