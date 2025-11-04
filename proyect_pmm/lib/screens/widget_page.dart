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
    _personas = [];
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
            
          ],
        ),
      ),
    );
  }
}