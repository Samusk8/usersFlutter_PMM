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
  late List<Person> _personasB;
  
  List<Person> get args => [];

  @override
  void initState(){
    super.initState();
    _personas = [];
    _personasB = [];
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as List<Person>;
    if (_personas.isEmpty && _personasB.isEmpty){
      _personas = List<Person>.from(args);
      _personasB = List<Person>.from(args);
    }
    print("LISTA DE PERSONASSS${_personas}");

    return Scaffold(
      appBar: AppBar(
        title: Text('Dissmis - Buscador'),
      ),
      body: Center(
        child: Column(
          children: [
            SearchBar(
              onChanged: (value) {
                setState(() {
                  _personasB = 
                  _personasB.where((p) => p.nombre.toLowerCase().contains(value.toLowerCase())).toList();
                  //for (Person p in _personasB) _crearCard(p);
                  print("asdd${_personasB}");
                      if (value.isEmpty){
                        _personasB = _personas;
                      }
                });
              },
            ),
            Text("Eliminar personas"),
            for (Person p in _personasB) _crearCard(p),
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
          _personasB.remove(p);
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