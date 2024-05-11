import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ai_gpt/screens/splash/splash_screen.dart';
import 'package:flutter_ai_gpt/theme/ag_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeGPT',
      debugShowCheckedModeBanner: false,
      theme: AGTheme.darkTheme(),
      home: const SplashScreen(),
    );
  }
}
