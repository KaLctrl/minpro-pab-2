import 'package:flutter/material.dart';
import 'config/supabase_config.dart';
import 'pages/login_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
  debugShowCheckedModeBanner: false,

  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 3, 188, 53),
    ),
    scaffoldBackgroundColor: const Color(0xFFF6F7FB),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),

  cardTheme: CardThemeData(
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
),
  ),

  home: const LoginPage(),
);
    
  }
}