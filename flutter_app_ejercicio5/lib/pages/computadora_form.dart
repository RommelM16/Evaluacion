/*import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';

/// Widget que representa un formulario para agregar o editar una computadora.
/// Puede recibir un objeto [PcModel] para la edición de una computadora existente.
/// Si no se proporciona, el formulario se utiliza para agregar una nueva computadora.
/// Utiliza la clase [PcDao] para interactuar con la base de datos.
class ComputadoraForm extends StatefulWidget {
  /// Objeto [PcModel] que contiene los datos de la computadora a editar.
  /// Si es `null`, el formulario se utiliza para agregar una nueva computadora.
  final PcModel? computadora;

  /// Callback que se invoca cuando la computadora se guarda exitosamente.
  final VoidCallback onSaved;

  /// Constructor del formulario, que puede recibir una computadora existente
  /// y un callback para manejar la acción después de guardar.
  const ComputadoraForm({super.key, this.computadora, required this.onSaved});

  @override
  State<ComputadoraForm> createState() => _ComputadoraFormState();
}

class _ComputadoraFormState extends State<ComputadoraForm> {
  // Llave global para identificar el estado del formulario.
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto del formulario.
  final _nombrePcController = TextEditingController();
  final _procesadorController = TextEditingController();
  final _discoDuroController = TextEditingController();
  final _ramController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Si se recibe una computadora para editar, inicializar los campos con sus valores.
    if (widget.computadora != null) {
      _nombrePcController.text = widget.computadora!.nombrePc;
      _procesadorController.text = widget.computadora!.procesador;
      _discoDuroController.text = widget.computadora!.discoDuro;
      _ramController.text = widget.computadora!.ram;
    }
  }

  @override
  void dispose() {
    // Liberar los controladores cuando el widget se destruye.
    _nombrePcController.dispose();
    _procesadorController.dispose();
    _discoDuroController.dispose();
    _ramController.dispose();
    super.dispose();
  }

  /// Método para guardar la computadora en la base de datos.
  ///
  /// Si [widget.computadora] es `null`, se inserta una nueva computadora.
  /// Si no, se actualizan los datos de la computadora existente.
  Future<void> _saveComputadora() async {
    // Validar el formulario antes de guardar.
    if (_formKey.currentState!.validate()) {
      // Crear un nuevo objeto PcModel con los datos del formulario.
      final newPc = PcModel(
        id: widget.computadora?.id,
        nombrePc: _nombrePcController.text,
        procesador: _procesadorController.text,
        discoDuro: _discoDuroController.text,
        ram: _ramController.text,
      );

      // Si no hay un objeto computadora, insertar un nuevo registro.
      // Si existe, actualizar el registro en la base de datos.
      if (widget.computadora == null) {
        await PcDao().insertPc(newPc);
      } else {
        await PcDao().updatePc(newPc);
      }

      // Ejecutar el callback proporcionado al guardar.
      widget.onSaved();
      // Navegar hacia atrás después de guardar los datos.
      Navigator.pop(context);
    }
  }

final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mostrar el título dinámico basado en si se está agregando o editando.
        title: Text(widget.computadora == null
            ? 'Agregar Computadora'
            : 'Editar Computadora'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/1.png',
                width: 175,
              ),
              const SizedBox(height: 40),
              Center(
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Campo de texto para el nombre de la PC.
                          TextFormField(
                            controller: _nombrePcController,
                            decoration:
                                const InputDecoration(labelText: 'Nombre PC'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para el procesador.
                          TextFormField(
                            controller: _procesadorController,
                            decoration:
                                const InputDecoration(labelText: 'Procesador'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para el disco duro.
                          TextFormField(
                            controller: _discoDuroController,
                            decoration:
                                const InputDecoration(labelText: 'Disco Duro'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para la memoria RAM.
                          TextFormField(
                            controller: _ramController,
                            decoration: const InputDecoration(labelText: 'RAM'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          const SizedBox(height: 20),
                          // Botón para guardar los datos.
                          ElevatedButton(
                            onPressed: _saveComputadora,
                        
                                    child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                  (widget.computadora == null ? Icons.add : Icons.edit),
  color: Colors.blue,
                                  ),
                                  const SizedBox(width: 6),
                                  Text((widget.computadora == null
                                ? 'Agregar'
                                : 'Actualizar'), style: txtBtnEstilo),
                                ],
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';

/// Widget que representa un formulario para agregar o editar una computadora.
/// Puede recibir un objeto [PcModel] para la edición de una computadora existente.
/// Si no se proporciona, el formulario se utiliza para agregar una nueva computadora.
/// Utiliza la clase [PcDao] para interactuar con la base de datos.
class ComputadoraForm extends StatefulWidget {
  /// Objeto [PcModel] que contiene los datos de la computadora a editar.
  /// Si es `null`, el formulario se utiliza para agregar una nueva computadora.
  final PcModel? computadora;

  /// Callback que se invoca cuando la computadora se guarda exitosamente.
  final VoidCallback onSaved;

  /// Constructor del formulario, que puede recibir una computadora existente
  /// y un callback para manejar la acción después de guardar.
  const ComputadoraForm({super.key, this.computadora, required this.onSaved});

  @override
  State<ComputadoraForm> createState() => _ComputadoraFormState();
}

class _ComputadoraFormState extends State<ComputadoraForm> {
  // Llave global para identificar el estado del formulario.
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto del formulario.
  final _nombrePcController = TextEditingController();
  final _procesadorController = TextEditingController();
  final _discoDuroController = TextEditingController();
  final _ramController = TextEditingController();
  final _precioController = TextEditingController(); // Controlador para el precio.

  @override
  void initState() {
    super.initState();
    // Si se recibe una computadora para editar, inicializar los campos con sus valores.
    if (widget.computadora != null) {
      _nombrePcController.text = widget.computadora!.nombrePc;
      _procesadorController.text = widget.computadora!.procesador;
      _discoDuroController.text = widget.computadora!.discoDuro;
      _ramController.text = widget.computadora!.ram;
      _precioController.text = widget.computadora!.precio.toString(); // Inicializar precio
    }
  }

  @override
  void dispose() {
    // Liberar los controladores cuando el widget se destruye.
    _nombrePcController.dispose();
    _procesadorController.dispose();
    _discoDuroController.dispose();
    _ramController.dispose();
    _precioController.dispose(); // Liberar controlador de precio
    super.dispose();
  }

  /// Método para guardar la computadora en la base de datos.
  ///
  /// Si [widget.computadora] es `null`, se inserta una nueva computadora.
  /// Si no, se actualizan los datos de la computadora existente.
  Future<void> _saveComputadora() async {
    // Validar el formulario antes de guardar.
    if (_formKey.currentState!.validate()) {
      // Crear un nuevo objeto PcModel con los datos del formulario.
      final newPc = PcModel(
        id: widget.computadora?.id,
        nombrePc: _nombrePcController.text,
        procesador: _procesadorController.text,
        discoDuro: _discoDuroController.text,
        ram: _ramController.text,
        precio: double.parse(_precioController.text), // Obtener el precio
      );

      // Si no hay un objeto computadora, insertar un nuevo registro.
      // Si existe, actualizar el registro en la base de datos.
      if (widget.computadora == null) {
        await PcDao().insertPc(newPc);
      } else {
        await PcDao().updatePc(newPc);
      }

      // Ejecutar el callback proporcionado al guardar.
      widget.onSaved();
      // Navegar hacia atrás después de guardar los datos.
      Navigator.pop(context);
    }
  }

  final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mostrar el título dinámico basado en si se está agregando o editando.
        title: Text(widget.computadora == null
            ? 'Agregar Computadora'
            : 'Editar Computadora'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/1.png',
                width: 175,
              ),
              const SizedBox(height: 40),
              Center(
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Campo de texto para el nombre de la PC.
                          TextFormField(
                            controller: _nombrePcController,
                            decoration:
                                const InputDecoration(labelText: 'Nombre PC'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para el procesador.
                          TextFormField(
                            controller: _procesadorController,
                            decoration:
                                const InputDecoration(labelText: 'Procesador'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para el disco duro.
                          TextFormField(
                            controller: _discoDuroController,
                            decoration:
                                const InputDecoration(labelText: 'Disco Duro'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para la memoria RAM.
                          TextFormField(
                            controller: _ramController,
                            decoration: const InputDecoration(labelText: 'RAM'),
                            validator: (value) =>
                                value!.isEmpty ? 'Campo requerido' : null,
                          ),
                          // Campo de texto para el precio.
                          TextFormField(
                            controller: _precioController,
                            decoration: const InputDecoration(labelText: 'Precio'),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo requerido';
                              } else if (double.tryParse(value) == null) {
                                return 'Ingresa un precio válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          // Botón para guardar los datos.
                          ElevatedButton(
                            onPressed: _saveComputadora,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  (widget.computadora == null ? Icons.add : Icons.edit),
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  (widget.computadora == null ? 'Agregar' : 'Actualizar'),
                                  style: txtBtnEstilo,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
