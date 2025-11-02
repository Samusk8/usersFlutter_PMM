class Person {
  String nombre;
  String apellido;
  String edad;
  String email;
  String contrasena;

  Person({
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.email,
    required this.contrasena
  });

  @override
  String toString() {
    
    return 'Person(nombre: $nombre, edad: $edad, email: $email)';
  }
}