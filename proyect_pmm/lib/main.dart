import 'package:flutter/material.dart';
import 'package:proyect_pmm/routes/routes.dart';
import 'package:proyect_pmm/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: 
          (BuildContext context) => HomePage()
        );
      },
      
    );
  }
}

