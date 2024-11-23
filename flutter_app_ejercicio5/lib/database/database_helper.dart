/*import 'package:sqflite/sqflite.dart';

/// Clase para la gestión de la base de datos utilizando el paquete sqflite.
class DatabaseHelper {
  // Instancia singleton de DatabaseHelper.
  static DatabaseHelper? _databaseHelper;

  /// Constructor privado para implementar el patrón singleton.
  DatabaseHelper._internal();

  /// Devuelve la instancia única de DatabaseHelper.
  /// Si no existe, se crea una nueva instancia.
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  // Instancia de la base de datos.
  Database? _db;

  /// Getter que devuelve la instancia de la base de datos.
  /// Asume que la base de datos ya ha sido inicializada.
  Database get db => _db!;

  /// Método para inicializar la base de datos.
  /// Abre la base de datos existente o crea una nueva si no existe.
  /// También define la estructura de la tabla `computadoras` al momento de la creación.
  Future<void> init() async {
    _db = await openDatabase(
      'database.db', // Nombre del archivo de la base de datos.
      version: 1, // Versión de la base de datos.
      onCreate: (db, version) {
        // Definición de la tabla `computadoras`.
        db.execute('''
          CREATE TABLE computadoras (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            nombrePc TEXT NOT NULL,              
            procesador TEXT NOT NULL,            
            discoDuro TEXT NOT NULL,             
            ram TEXT NOT NULL
          )
        ''');
      },
    );
  }
}*//*
import 'package:sqflite/sqflite.dart';

/// Clase para la gestión de la base de datos utilizando el paquete sqflite.
class DatabaseHelper {
  // Instancia singleton de DatabaseHelper.
  static DatabaseHelper? _databaseHelper;

  /// Constructor privado para implementar el patrón singleton.
  DatabaseHelper._internal();

  /// Devuelve la instancia única de DatabaseHelper.
  /// Si no existe, se crea una nueva instancia.
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  // Instancia de la base de datos.
  Database? _db;

  /// Getter que devuelve la instancia de la base de datos.
  /// Asume que la base de datos ya ha sido inicializada.
  Database get db => _db!;

  /// Método para inicializar la base de datos.
  /// Abre la base de datos existente o crea una nueva si no existe.
  /// También define la estructura de la tabla `computadoras` al momento de la creación.
  Future<void> init() async {
    _db = await openDatabase(
      'database.db', // Nombre del archivo de la base de datos.
      version: 1, // Versión de la base de datos.
      onCreate: (db, version) {
        // Definición de la tabla `computadoras`.
        db.execute('''
          CREATE TABLE computadoras (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            nombrePc TEXT NOT NULL,              
            procesador TEXT NOT NULL,            
            discoDuro TEXT NOT NULL,             
            ram TEXT NOT NULL,
          )
        ''');

        // Precarga de datos en la tabla `computadoras`
        _insertDefaultData(db);
      },
    );
  }

  /// Método para insertar datos predeterminados.
  void _insertDefaultData(Database db) async {
    // Datos predeterminados para la tabla `computadoras`
    await db.insert('computadoras', {
      'nombrePc': 'PC1',
      'procesador': 'Intel i5',
      'discoDuro': '500GB',
      'ram': '8GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC2',
      'procesador': 'AMD Ryzen 7',
      'discoDuro': '1TB',
      'ram': '16GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC3',
      'procesador': 'Intel i7',
      'discoDuro': '250GB',
      'ram': '16GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC4',
      'procesador': 'Intel i3',
      'discoDuro': '1TB',
      'ram': '4GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC5',
      'procesador': 'AMD Ryzen 5',
      'discoDuro': '500GB',
      'ram': '8GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC6',
      'procesador': 'Intel i9',
      'discoDuro': '2TB',
      'ram': '32GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC7',
      'procesador': 'Intel i5',
      'discoDuro': '1TB',
      'ram': '16GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC8',
      'procesador': 'AMD Ryzen 9',
      'discoDuro': '1TB',
      'ram': '64GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC9',
      'procesador': 'Intel Xeon',
      'discoDuro': '2TB',
      'ram': '128GB'
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC10',
      'procesador': 'AMD Ryzen 3',
      'discoDuro': '250GB',
      'ram': '8GB'
    });
  }
}*/
import 'package:sqflite/sqflite.dart';

/// Clase para la gestión de la base de datos utilizando el paquete sqflite.
class DatabaseHelper {
  // Instancia singleton de DatabaseHelper.
  static DatabaseHelper? _databaseHelper;

  /// Constructor privado para implementar el patrón singleton.
  DatabaseHelper._internal();

  /// Devuelve la instancia única de DatabaseHelper.
  /// Si no existe, se crea una nueva instancia.
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  // Instancia de la base de datos.
  Database? _db;

  /// Getter que devuelve la instancia de la base de datos.
  /// Asume que la base de datos ya ha sido inicializada.
  Database get db => _db!;

  /// Método para inicializar la base de datos.
  /// Abre la base de datos existente o crea una nueva si no existe.
  /// También define la estructura de la tabla `computadoras` al momento de la creación.
  Future<void> init() async {
    _db = await openDatabase(
      'database.db', // Nombre del archivo de la base de datos.
      version: 1, // Versión de la base de datos.
      onCreate: (db, version) {
        // Definición de la tabla `computadoras` con el campo `precio`.
        db.execute('''
          CREATE TABLE computadoras (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            nombrePc TEXT NOT NULL,              
            procesador TEXT NOT NULL,            
            discoDuro TEXT NOT NULL,             
            ram TEXT NOT NULL,
            precio REAL NOT NULL               -- Campo de precio agregado
          )
        ''');

        // Precarga de datos en la tabla `computadoras`
        _insertDefaultData(db);
      },
    );
  }

  /// Método para insertar datos predeterminados.
  void _insertDefaultData(Database db) async {
    await db.insert('computadoras', {
      'nombrePc': 'PC Lenovo',
      'procesador': 'Intel i5',
      'discoDuro': '500GB',
      'ram': '8GB',
      'precio': 500.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC Asus',
      'procesador': 'AMD Ryzen 7',
      'discoDuro': '1TB',
      'ram': '16GB',
      'precio': 1000.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC Dell',
      'procesador': 'Intel i7',
      'discoDuro': '250GB',
      'ram': '16GB',
      'precio': 1200.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC Lenovo',
      'procesador': 'Intel i3',
      'discoDuro': '1TB',
      'ram': '4GB',
      'precio': 400.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC Dell',
      'procesador': 'AMD Ryzen 5',
      'discoDuro': '500GB',
      'ram': '8GB',
      'precio': 600.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC HP',
      'procesador': 'Intel i9',
      'discoDuro': '2TB',
      'ram': '32GB',
      'precio': 1500.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC7',
      'procesador': 'Intel i5',
      'discoDuro': '1TB',
      'ram': '16GB',
      'precio': 800.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC8',
      'procesador': 'AMD Ryzen 9',
      'discoDuro': '1TB',
      'ram': '64GB',
      'precio': 2000.0 
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC Asus',
      'procesador': 'Intel Xeon',
      'discoDuro': '2TB',
      'ram': '128GB',
      'precio': 2500.0  
    });

    await db.insert('computadoras', {
      'nombrePc': 'PC Lenovo',
      'procesador': 'AMD Ryzen 3',
      'discoDuro': '250GB',
      'ram': '8GB',
      'precio': 450.0 
    });
  }
}

