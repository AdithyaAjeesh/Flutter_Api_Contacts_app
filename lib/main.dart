import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/controller/provider_functions.dart';
import 'package:flutter_contacts_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
