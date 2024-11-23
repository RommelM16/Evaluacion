/*import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _password, _email, _cellphone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              'images/1.png',
              width: 200,
            ),
            const SizedBox(height: 20),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Campo de Usuario
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Usuario',
                            border: UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su usuario';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Campo de Clave
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Clave',
                            border: UnderlineInputBorder(),
                          ),
                          obscureText:
                              true, // Oculta el texto para la contraseña
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su clave';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Campo de Correo Electrónico
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.mail),
                            labelText: 'Correo Electrónico',
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su correo electrónico';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Por favor ingrese un correo válido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Campo de Celular
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.call),
                            labelText: 'Celular',
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su número de celular';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Por favor ingrese un celular válido (10 dígitos)';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _cellphone = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Botón de Registro
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              debugPrint('-Username: $_username\n'
                                  '-Password: $_password\n'
                                  '-Email: $_email\n'
                                  '-Cellphone: $_cellphone');
                            }
                          },
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ),
    );
  }
}
*//*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _address, _cellphone;
  late TextEditingController _usernameController;
  late TextEditingController _cellphoneController;
  late TextEditingController _addressController;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para cargar los datos del usuario desde Firestore
  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await _firestore.collection('users').doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          _usernameController.text = userData['name'] ?? '';
          _cellphoneController.text = userData['phone'] ?? '';
          _addressController.text = userData['address'] ?? '';
        });
      }
    }
  }

  // Método para guardar los datos del usuario en Firestore
  Future<void> _saveUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'name': _username,
        'phone': _cellphone,
        'address': _address,
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos actualizados exitosamente')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _cellphoneController = TextEditingController();
    _addressController = TextEditingController();
    _loadUserData(); // Cargar los datos del usuario al inicio
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _cellphoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/1.png',
                width: 200,
              ),
              const SizedBox(height: 20),
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Campo de Nombre
                          TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Nombre',
                              border: UnderlineInputBorder(),
                            ),
                            onSaved: (value) {
                              _username = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          // Campo de Correo Electrónico
                          TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.mail),
                              labelText: 'Dirección',
                              border: UnderlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _address = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          // Campo de Celular
                          TextFormField(
                            controller: _cellphoneController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.call),
                              labelText: 'Celular',
                              border: UnderlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              _cellphone = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          // Botón de Guardar
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _saveUserData(); // Guardar los datos en Firestore
                              }
                            },
                            child: const Text(
                              'Actualizar',
                              style: TextStyle(color: Colors.blue),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ),
    );
  }
}
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _address, _cellphone;
  late TextEditingController _usuarioController;
  late TextEditingController _celularController;
  late TextEditingController _direccionController;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para cargar los datos del usuario desde Firestore
  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await _firestore.collection('users').doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          _usuarioController.text = userData['name'] ?? '';
          _celularController.text = userData['phone'] ?? '';
          _direccionController.text = userData['address'] ?? '';
        });
      }
    }
  }

  // Método para guardar los datos del usuario en Firestore
  Future<void> guardarDatosUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'name': _username,
        'phone': _cellphone,
        'address': _address,
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos actualizados exitosamente')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _usuarioController = TextEditingController();
    _celularController = TextEditingController();
    _direccionController = TextEditingController();
    _loadUserData(); // Cargar los datos del usuario al inicio
  }

  @override
  void dispose() {
    _usuarioController.dispose();
    _celularController.dispose();
    _direccionController.dispose();
    super.dispose();
  }

  // Validación de los campos
  String? _validarCampos(String? value, String fieldName, {bool isEmail = false}) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su $fieldName';
    }
    if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Por favor ingrese un correo electrónico válido';
    }
    if (fieldName == 'Celular' && !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
      return 'Por favor ingrese un número de teléfono válido';
    }
    return null;
  }

 final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/1.png',
                width: 200,
              ),
              const SizedBox(height: 20),
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Campo de Nombre
                          TextFormField(
                            controller: _usuarioController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Nombre',
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              return _validarCampos(value, 'Nombre');
                            },
                            onSaved: (value) {
                              _username = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          // Campo de Dirección
                          TextFormField(
                            controller: _direccionController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: 'Dirección',
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              return _validarCampos(value, 'Dirección');
                            },
                            onSaved: (value) {
                              _address = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          // Campo de Celular
                          TextFormField(
                            controller: _celularController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.call),
                              labelText: 'Celular',
                              border: UnderlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              return _validarCampos(value, 'Celular');
                            },
                            onSaved: (value) {
                              _cellphone = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          // Botón de Guardar
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                guardarDatosUser(); // Guardar los datos en Firestore
                              }
                            },
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.person_add_alt,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 6),
                                  Text("Actualizar", style: txtBtnEstilo),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ),
    );
  }
}
