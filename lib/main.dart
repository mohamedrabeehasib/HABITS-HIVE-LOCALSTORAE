import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/screens/home_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            titleTextStyle: acme.copyWith(
              fontSize: 24,
              color: Colors.black,
              letterSpacing: 10,
            )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

var acme = GoogleFonts.acme();




