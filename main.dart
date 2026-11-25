import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/splash_page.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const QuizLearnApp());
}

class QuizLearnApp extends StatelessWidget {
  const QuizLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: namaAplikasi,
      debugShowCheckedModeBanner: false,
      theme: buatTema(),
      home: const SplashPage(),
    );
  }
}
