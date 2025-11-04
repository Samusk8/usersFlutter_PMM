import 'package:flutter/material.dart';
import 'package:proyect_pmm/objects/person.dart';

//voy a escribir la lista de personas aqui tambien de otra forma
class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {

  late List<Person> _personas;
  
  List<Person> get args => [];

  @override
  void initState(){
    super.initState();
    List<Person> _personas = [];
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as List<Person>;
    _personas = args;

    print("LISTA DE PERSONASSS${_personas}");

    return Scaffold(
      appBar: AppBar(
        title: Text('Dissmis'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Eliminar personas"),
            for (Person p in _personas) _crearCard(p),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _personas);
              },
              child: Text("Guardar")
            )
          ],
        ),
      ),
    );
  }

    _crearCard(Person p) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed:(direction) {
        setState(() {
          _personas.remove(p);
        });
      },
      child: Card(
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
      ),
    );
  }
}