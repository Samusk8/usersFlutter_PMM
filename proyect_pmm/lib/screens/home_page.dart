import 'package:flutter/material.dart';


// He creado un Stateful Widget porque
// voy a mostrar las personas que se creen en esta pag
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PF1"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('personal'),
              onPressed: () {
                Navigator.pushNamed(context,'personal');
              
              }, 
              
            ),
            Padding(padding: EdgeInsetsGeometry.all(15)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'widget');
              }, 
              child: Text('Widgets')
            ),
          ],
        ),
      ),
    );
  }
}