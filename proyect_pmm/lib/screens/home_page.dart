import 'package:flutter/material.dart';
import 'package:proyect_pmm/objects/person.dart';


// He creado un Stateful Widget porque
// voy a mostrar las personas que se creen en esta pag
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Person> _personas = [];

  @override
  void initState(){
    super.initState;
    print("PERSONASSSSSS  $_personas");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PF1"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('personal'),
                  onPressed: () async {
                    final Person persona = Person(nombre: 'Samuel', apellido: 'Jiménez', edad: 19, email: 'Samuel@gmail.com', contrasena: '1234abc');
                    final respuesta = await Navigator.pushNamed(context,'personal', arguments: persona);
                    if (respuesta != null && respuesta is Person){
                      setState(() {
                        _personas.add(respuesta);
                      });
                    }
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
            Column(

            ),
          ],
        ),
      ),
    );
  }
}