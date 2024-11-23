import 'package:flutter_app_ejercicio3/database/database_helper.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';

/// Clase Data Access Object (DAO) para interactuar con la tabla `computadoras` en la base de datos.
class PcDao {
  // Obtiene la instancia de la base de datos a través de DatabaseHelper.
  final database = DatabaseHelper.instance.db;

  /// Método para obtener todas las computadoras de la tabla `computadoras`.
  /// Retorna una lista de objetos `PcModel` que representan cada fila en la tabla.
  Future<List<PcModel>> readAllPc() async {
    // Realiza una consulta para obtener todos los registros de la tabla `computadoras`.
    final data = await database.query('computadoras');
    // Convierte cada mapa (map) en un objeto `PcModel` y devuelve la lista resultante.
    return data.map((map) => PcModel.fromMap(map)).toList();
  }

  /// Método para insertar un nuevo registro en la tabla `computadoras`.
  /// Toma un objeto `PcModel` y lo inserta en la base de datos.
  /// Retorna el `id` del registro insertado.
  Future<int> insertPc(PcModel pc) async {
    return await database.insert('computadoras', pc.toMap());
  }

  /// Método para actualizar un registro existente en la tabla `computadoras`.
  /// Toma un objeto `PcModel` con un `id` ya existente y actualiza los datos de esa fila.
  /// No retorna ningún valor.
  Future<void> updatePc(PcModel pc) async {
    await database.update(
      'computadoras',       // Nombre de la tabla.
      pc.toMap(),           // Nuevos datos en forma de mapa.
      where: 'id = ?',      // Condición para seleccionar el registro a actualizar.
      whereArgs: [pc.id],   // Argumentos para la condición (id del registro).
    );
  }

  /// Método para eliminar un registro de la tabla `computadoras`.
  /// Toma el `id` del registro que se desea eliminar.
  /// Retorna el número de filas afectadas (debería ser 1 si la eliminación fue exitosa).
  Future<int> deletePc(int id) async {
    return await database.delete(
      'computadoras',       // Nombre de la tabla.
      where: 'id = ?',      // Condición para seleccionar el registro a eliminar.
      whereArgs: [id],      // Argumentos para la condición (id del registro).
    );
  }
}
