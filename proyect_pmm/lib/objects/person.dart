class Person {
  String nombre;
  int edad;
  String email;

  Person({
    required this.nombre,
    required this.edad,
    required this.email,
  });

  @override
  String toString() {
    
    return 'Person(nombre: $nombre, edad: $edad, email: $email)';
  }
}