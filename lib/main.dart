import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider() ,
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          textTheme: GoogleFonts.lunasimaTextTheme(const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              displayMedium:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          appBarTheme: const AppBarTheme(
              toolbarTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(184, 149, 255, 0)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
