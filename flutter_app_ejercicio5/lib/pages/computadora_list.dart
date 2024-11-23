/*import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';
import 'computadora_form.dart';

/// Esta clase representa la pantalla principal que muestra una lista de computadoras
/// registradas en la base de datos. Permite agregar, editar y eliminar registros.
class ComputadoraList extends StatefulWidget {
  const ComputadoraList({super.key});

  @override
  State<ComputadoraList> createState() => _ComputadoraListState();
}

class _ComputadoraListState extends State<ComputadoraList> {
  // Variable que almacena una futura lista de objetos PcModel.
  late Future<List<PcModel>> computadoras;

  @override
  void initState() {
    super.initState();
    // Inicializa la lista de computadoras desde la base de datos.
    computadoras = PcDao().readAllPc();
  }

  /// Método para refrescar la lista de computadoras después de realizar operaciones
  /// como agregar, editar o eliminar. Vuelve a cargar los datos desde la base de datos.
  void _refreshList() {
    setState(() {
      computadoras = PcDao().readAllPc();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      // Utiliza FutureBuilder para manejar la carga asíncrona de datos.
      body: FutureBuilder<List<PcModel>>(
        future: computadoras,
        builder: (context, snapshot) {
          // Muestra un indicador de carga mientras se obtienen los datos.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          // Maneja cualquier error que ocurra al obtener los datos.
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } 
          // Caso cuando no hay computadoras registradas.
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No hay computadoras registradas.'));
          } 
          // Si hay datos disponibles, los muestra en una lista.
          else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pc = snapshot.data![index];
                return ListTile(
                  // Muestra el nombre de la computadora.
                  title: Text(
                    pc.nombrePc,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'RocknRoll One',
                    ),
                  ),
                  // Muestra el procesador, la RAM y el disco duro en el subtítulo.
                  subtitle: Text(
                    'PROCESADOR: ${pc.procesador}\nRAM: ${pc.ram}\nDisco: ${pc.discoDuro}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  // Añade botones para editar y eliminar.
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Botón para editar la computadora.
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Navega a la pantalla de edición.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComputadoraForm(
                                computadora: pc,
                                onSaved: _refreshList,
                              ),
                            ),
                          );
                        },
                      ),
                      // Botón para eliminar la computadora.
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          // Elimina la computadora de la base de datos.
                          await PcDao().deletePc(pc.id!);
                          _refreshList(); // Refresca la lista tras la eliminación.
                        },
                      ),
                    ],
                  ),
                );
              },
              // Añade un separador entre los elementos de la lista.
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            );
          }
        },
      ),
      // Botón flotante para agregar una nueva computadora.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega a la pantalla de creación de una nueva computadora.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComputadoraForm(
                onSaved: _refreshList,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}*//*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';
import 'computadora_form.dart';

class ComputadoraList extends StatefulWidget {
  const ComputadoraList({super.key});

  @override
  State<ComputadoraList> createState() => _ComputadoraListState();
}

class _ComputadoraListState extends State<ComputadoraList> {
  late Future<List<PcModel>> computadoras;

  @override
  void initState() {
    super.initState();
    computadoras = PcDao().readAllPc();
  }

  void _refreshList() {
    setState(() {
      computadoras = PcDao().readAllPc();
    });
  }

  // Función para guardar el producto comprado en Firestore
  Future<void> _saveProductToOrder(PcModel pc) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Map<String, dynamic> orderData = {
        'userId': user.uid,
        'productId': pc.id,
        'productName': pc.nombrePc,
        'productPrice': pc.ram, // Usamos 'ram' como ejemplo de precio
        'orderDate': Timestamp.now(),
      };

      try {
        await FirebaseFirestore.instance.collection('orders').add(orderData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto comprado con éxito!')),
        );
      } catch (e) {
        print("Error al agregar la orden: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al procesar la compra.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes iniciar sesión para comprar.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      body: FutureBuilder<List<PcModel>>(
        future: computadoras,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No hay computadoras registradas.'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pc = snapshot.data![index];
                return ListTile(
                  title: Text(
                    pc.nombrePc,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'RocknRoll One',
                    ),
                  ),
                  subtitle: Text(
                    'PROCESADOR: ${pc.procesador}\nRAM: ${pc.ram}\nDisco: ${pc.discoDuro}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Botón para editar la computadora
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComputadoraForm(
                                computadora: pc,
                                onSaved: _refreshList,
                              ),
                            ),
                          );
                        },
                      ),
                      // Botón para eliminar la computadora
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await PcDao().deletePc(pc.id!);
                          _refreshList();
                        },
                      ),
                      // Botón "Comprar"
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          _saveProductToOrder(
                              pc); // Llama la función para guardar el producto
                        },
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComputadoraForm(
                onSaved: _refreshList,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';
import 'computadora_form.dart';

class ComputadoraList extends StatefulWidget {
  const ComputadoraList({super.key});

  @override
  State<ComputadoraList> createState() => _ComputadoraListState();
}

class _ComputadoraListState extends State<ComputadoraList> {
  late Future<List<PcModel>> computadoras;

  @override
  void initState() {
    super.initState();
    computadoras = PcDao().readAllPc();
  }

  void _refreshList() {
    setState(() {
      computadoras = PcDao().readAllPc();
    });
  }

  // Función para guardar el producto comprado en Firestore
  Future<void> _saveProductToOrder(PcModel pc) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Map<String, dynamic> orderData = {
        'userId': user.uid,
        'productId': pc.id,
        'productName': pc.nombrePc,
        'productPrice': pc.ram, // Usamos 'ram' como ejemplo de precio
        'orderDate': Timestamp.now(),
      };

      try {
        await FirebaseFirestore.instance.collection('orders').add(orderData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto comprado con éxito!')),
        );
      } catch (e) {
        print("Error al agregar la orden: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al procesar la compra.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes iniciar sesión para comprar.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      body: FutureBuilder<List<PcModel>>(
        future: computadoras,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No hay computadoras registradas.'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pc = snapshot.data![index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      pc.nombrePc,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PROCESADOR: ${pc.procesador}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'RAM: ${pc.ram}GB',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'DISCO: ${pc.discoDuro}GB',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Botón para editar la computadora
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ComputadoraForm(
                                  computadora: pc,
                                  onSaved: _refreshList,
                                ),
                              ),
                            );
                          },
                        ),
                        // Botón para eliminar la computadora
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await PcDao().deletePc(pc.id!);
                            _refreshList();
                          },
                        ),
                        // Botón "Comprar"
                        IconButton(
                          icon: const Icon(Icons.shopping_cart, color: Colors.green),
                          onPressed: () {
                            _saveProductToOrder(pc); // Llama la función para guardar el producto
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComputadoraForm(
                onSaved: _refreshList,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';
import 'computadora_form.dart';

class ComputadoraList extends StatefulWidget {
  const ComputadoraList({super.key});

  @override
  State<ComputadoraList> createState() => _ComputadoraListState();
}

class _ComputadoraListState extends State<ComputadoraList> {
  late Future<List<PcModel>> computadoras;

  @override
  void initState() {
    super.initState();
    computadoras = PcDao().readAllPc();
  }

  void _refreshList() {
    setState(() {
      computadoras = PcDao().readAllPc();
    });
  }

  // Función para guardar el producto comprado en Firestore
  Future<void> _saveProductToOrder(PcModel pc) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Map<String, dynamic> orderData = {
        'userId': user.uid,
        'productId': pc.id,
        'productName': pc.nombrePc,
        'productPrice': pc.precio, // Usamos 'precio' como el valor real del producto
        'orderDate': Timestamp.now(),
      };

      try {
        await FirebaseFirestore.instance.collection('orders').add(orderData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto comprado con éxito!')),
        );
      } catch (e) {
        print("Error al agregar la orden: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al procesar la compra.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes iniciar sesión para comprar.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      body: FutureBuilder<List<PcModel>>(
        future: computadoras,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No hay computadoras registradas.'));
          } else {
            return ListView.builder( // Cambiar a ListView.builder en lugar de ListView.separated
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pc = snapshot.data![index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      pc.nombrePc,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PROCESADOR: ${pc.procesador}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'RAM: ${pc.ram}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'DISCO: ${pc.discoDuro}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        
                        Text(
                          'Precio: \$${pc.precio.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Botón para editar la computadora
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ComputadoraForm(
                                  computadora: pc,
                                  onSaved: _refreshList,
                                ),
                              ),
                            );
                          },
                        ),
                        // Botón para eliminar la computadora
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await PcDao().deletePc(pc.id!);
                            _refreshList();
                          },
                        ),
                        // Botón "Comprar"
                        IconButton(
                          icon: const Icon(Icons.shopping_cart, color: Colors.green),
                          onPressed: () {
                            _saveProductToOrder(pc); // Llama la función para guardar el producto
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComputadoraForm(
                onSaved: _refreshList,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
