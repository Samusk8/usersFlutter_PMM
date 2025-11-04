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

  List<Person> _personas = [];

  @override
  void initState(){
    super.initState;
    print("PERSONASSSSSS  $_personas");

  }
  
  @override
  Widget build(BuildContext context) {
    //for(Person p in _personas) _crearCard(p);
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
                    final Person persona = Person(nombre: 'Samuel', apellido: 'Jiménez', edad: '', email: 'Samuel@gmail.com', contrasena: '1234abc');
                    final respuesta = await Navigator.pushNamed(context,'personal', arguments: persona);

                    /*ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Añadida: ${persona.nombre}'), duration: Duration(seconds: 2))
                    );*/
                    if (respuesta != null && respuesta is Person){
                      setState(() {
                        _personas.add(respuesta);
                        print('lista de personas  $_personas');
                      });
                    }
                  }, 

                  
                ),
                Padding(padding: EdgeInsetsGeometry.all(15)),
                ElevatedButton(
                  onPressed: () async {
                    final respuesta1 = await Navigator.pushNamed(context, 'widget', arguments: _personas);

                    if (respuesta1 != null) {
                      final List<Person> _personas1 = List<Person>.from(
                        (respuesta1 as List).cast<Person>() 
                      );
                      setState(() {

                        _personas = _personas1;
                      });
                    }
                  }, 
                  child: Text('Widgets')
                ),
              ],
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Personas: "),
                for(Person p in _personas) _crearCard(p),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _crearCard(Person p) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("${p.nombre}  ${p.apellido}"),
            subtitle: Text(p.email),
            trailing: Text(p.edad),
          )
        ],
      ),
    );
  }
}