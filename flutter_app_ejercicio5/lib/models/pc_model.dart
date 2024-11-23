/*class PcModel {
  int? id;
  String nombrePc;
  String procesador;
  String discoDuro;
  String ram;

  PcModel(
      {this.id,
      required this.nombrePc,
      required this.procesador,
      required this.discoDuro,
      required this.ram});

  // Convertir un objeto Computadora en un Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombrePc': nombrePc,
      'procesador': procesador,
      'discoDuro': discoDuro,
      'ram': ram,
    };
  }

  // Crear un objeto Computadora a partir de un Map
  factory PcModel.fromMap(Map<String, dynamic> map) {
    return PcModel(
      id: map['id'],
      nombrePc: map['nombrePc'],
      procesador: map['procesador'],
      discoDuro: map['discoDuro'],
      ram: map['ram'],
    );
  }
}
*/
class PcModel {
  int? id;
  String nombrePc;
  String procesador;
  String discoDuro;
  String ram;
  double precio; // Nuevo campo precio

  PcModel({
    this.id,
    required this.nombrePc,
    required this.procesador,
    required this.discoDuro,
    required this.ram,
    required this.precio, // Se agrega al constructor
  });

  // Convertir un objeto PcModel en un Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombrePc': nombrePc,
      'procesador': procesador,
      'discoDuro': discoDuro,
      'ram': ram,
      'precio': precio, // Agregar precio al mapa
    };
  }

  // Crear un objeto PcModel a partir de un Map
  factory PcModel.fromMap(Map<String, dynamic> map) {
    return PcModel(
      id: map['id'],
      nombrePc: map['nombrePc'],
      procesador: map['procesador'],
      discoDuro: map['discoDuro'],
      ram: map['ram'],
      precio: map['precio'], // Obtener el precio del mapa
    );
  }
}
