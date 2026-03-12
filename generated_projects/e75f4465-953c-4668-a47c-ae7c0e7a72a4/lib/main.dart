import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meerut_metro/app.dart';

void main() {
  runApp(const MeerutMetroApp());
}

class MeerutMetroApp extends StatelessWidget {
  const MeerutMetroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meerut Metro',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0055A4), // Metro Blue
          primary: const Color(0xFF0055A4),
          secondary: const Color(0xFFF1C40F),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF0055A4),
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xFF0055A4),
        ),
      ),
      home: const MainScaffold(),
    );
  }
}
