import 'package:flutter/material.dart';
import 'package:proyect_pmm/objects/person.dart';

//Stateful widget porque voy a mostrar los cambios de la persona
//en tiempo real
class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  
  
  String _nombre = '';
  String _apellido = '';
  String _email = '';
  String _fecha = '';
  String _password = '';
  TextEditingController _inputFieldFechaController =TextEditingController();
  late Person _persona;

  TextEditingController _nombreCtrl = TextEditingController();
  TextEditingController _apellidoCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _contrasenaCtrl = TextEditingController();
  

@override
void initState() {
  super.initState();
  _nombreCtrl = TextEditingController();
  _apellidoCtrl = TextEditingController();
  _emailCtrl = TextEditingController();
  _contrasenaCtrl = TextEditingController();
}

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null && args is Person){
      _persona = args;
      _nombreCtrl.text = _persona.nombre;
      _apellidoCtrl.text = _persona.apellido;
      _emailCtrl.text = _persona.email;
      _contrasenaCtrl.text = _persona.contrasena;
      
      print("Persona111111 ${_persona.toString()}");

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Samuel Jiménez"),

      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        children: [
          _crearNombre(),
          Divider(),
          _crearApellido(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona(),
          Divider(),
          _enviar(),

        ],
      ),
    );
  }

  
  _crearNombre() {
    return TextField(
      //autofocus: true,
      controller: _nombreCtrl,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre del Usuario',
        labelText: 'Nombre',
        helperText: 'Escriba su nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
          print(_nombre);
        });
      },
    );
  }

  _crearApellido() {
    return TextField(
      //autofocus: true,
      controller: _apellidoCtrl,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_apellido.length}'),
        hintText: 'Apellido del Usuario',
        labelText: 'Apellido',
        helperText: 'Escriba su apellido',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _apellido = value;
          print(_apellido);
        });
      },
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldFechaController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaFecha(context);
      },
    );
  }
  
  _crearEmail() {
    return TextField(
      //autofocus: true,
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        
        hintText: 'Correo Electronico',
        labelText: 'Correo',
        //helperText: 'Escriba el Correo completo',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
          print(_email);
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      controller: _contrasenaCtrl,
      //autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
          print(_password);
        });
      },
    );
  }


  void _seleccionaFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      //locale: Locale('es','Es'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030)
    );
    if (picked != null){
      setState((){
        _fecha = picked.toString();
        _inputFieldFechaController.text = _fecha;
      }
    );
   }

    
  }


  _crearPersona() {
    return ListTile(
      title: Text('Nombre: ${_nombre +' '+ _apellido} '),
      subtitle: Text('Correo: $_email'),
      trailing: Text(_fecha),
    );
  }

  _enviar(){
    return Container(
      child: ElevatedButton(
        child: Text('Enviar'),
        onPressed: () {
          final Person _persona1 = Person(nombre: _nombre, apellido: _apellido, edad: _fecha, email: _email, contrasena: _password);
          if (_nombre == ""){

            Navigator.pop(context, _persona);
          } else {
            Navigator.pop(context, _persona1);
          }
        },
      ),
    );
  }

}


