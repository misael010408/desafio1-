class Alumno {
  String nombre;
  String apellido;
  int edad;
  List<double> notas;

  Alumno({
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.notas,
  });

  double calcularPromedio() {
    double suma = notas.reduce((a, b) => a + b);
    return suma / notas.length;
  }

  String estadoFinal() {
    double promedio = calcularPromedio();

    if (promedio >= 6) {
      return 'Aprobado';
    } else if (promedio >= 4) {
      return 'Recuperatorio';
    } else {
      return 'Desaprobado';
    }
  }

  @override
  String toString() {
    return '$nombre $apellido - ${estadoFinal()} '
        '- Promedio: ${calcularPromedio().toStringAsFixed(2)}';
  }
}

void main() {
  List<Alumno> alumnos = [
    Alumno(
      nombre: 'Juan',
      apellido: 'Perez',
      edad: 16,
      notas: [8, 9, 7],
    ),
    Alumno(
      nombre: 'Maria',
      apellido: 'Gomez',
      edad: 17,
      notas: [5, 6, 4],
    ),
    Alumno(
      nombre: 'Lucas',
      apellido: 'Lopez',
      edad: 16,
      notas: [9, 10, 10],
    ),
    Alumno(
      nombre: 'Sofia',
      apellido: 'Diaz',
      edad: 17,
      notas: [3, 4, 2],
    ),
    Alumno(
      nombre: 'Pedro',
      apellido: 'Torres',
      edad: 16,
      notas: [7, 8, 6],
    ),
  ];

  print('===== REGISTRO DE ALUMNOS =====');

  for (var alumno in alumnos) {
    print(alumno);
  }

  // Encontrar al alumno con mayor promedio.
  Alumno mejorAlumno = alumnos.reduce(
    (a, b) => a.calcularPromedio() > b.calcularPromedio() ? a : b,
  );

  print('\n===== MEJOR PROMEDIO =====');
  print(mejorAlumno);

  // Contar aprobados y desaprobados.
  int aprobados = 0;
  int desaprobados = 0;

  for (var alumno in alumnos) {
    if (alumno.estadoFinal() == 'Aprobado') {
      aprobados++;
    } else if (alumno.estadoFinal() == 'Desaprobado') {
      desaprobados++;
    }
  }

  print('\n===== RESULTADOS =====');
  print('Alumnos aprobados: $aprobados');
  print('Alumnos desaprobados: $desaprobados');

  // Ordenar de mayor a menor promedio.
  alumnos.sort(
    (a, b) => b.calcularPromedio().compareTo(a.calcularPromedio()),
  );

  print('\n===== ALUMNOS ORDENADOS =====');

  for (var alumno in alumnos) {
    print(alumno);
  }
}
