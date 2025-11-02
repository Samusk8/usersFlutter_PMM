class Person {
  String nombre;
  String apellido;
  int? edad;
  String email;
  String contrasena;

  Person({
    required this.nombre,
    required this.apellido,
    this.edad,
    required this.email,
    required this.contrasena
  });

  @override
  String toString() {
    
    return 'Person(nombre: $nombre, edad: $edad, email: $email)';
  }
}