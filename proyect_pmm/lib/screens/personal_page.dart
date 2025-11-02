import 'package:flutter/material.dart';

//Stateful widget porque voy a mostrar los cambios de la persona
//en tiempo real
class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _pais = 'España';
  TextEditingController _inputFieldFechaController =TextEditingController();
  List<String> _paises = ['Andorra','Inglaterra','Dinamarca','España','Francia'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Samuel Jiménez"),
      ),
    );
  }

}


