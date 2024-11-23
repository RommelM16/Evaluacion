/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:flutter_app_ejercicio3/pages/inicio.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;

    User? user = await _authService.registerWithEmailPassword(
        email, password, name, phone, address);

    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Registro exitoso')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InicioPage()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error al registrar')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
*/ 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:flutter_app_ejercicio3/pages/inicio.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      String name = _nameController.text;
      String phone = _phoneController.text;
      String address = _addressController.text;

      // Llamamos al método de registro de la clase AuthService
      User? user = await _authService.registerWithEmailPassword(
          email, password, name, phone, address);

      if (user != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Registro exitoso')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>const  InicioPage()),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Error al registrar')));
      }
    }
  }

  final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse')),
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Campo para correo electrónico
                          TextFormField(
                            controller: _emailController,
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
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Por favor ingrese un correo válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Campo para la contraseña
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Contraseña',
                              border: UnderlineInputBorder(),
                            ),
                            obscureText: true, // Oculta el texto para la contraseña
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su contraseña';
                              }
                              if (value.length < 6) {
                                return 'La contraseña debe tener al menos 6 caracteres';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Campo para el nombre
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Nombre',
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su nombre';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Campo para el teléfono
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.phone),
                              labelText: 'Teléfono',
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su número de teléfono';
                              }
                              if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                                return 'Por favor ingrese un teléfono válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Campo para la dirección
                          TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: 'Dirección',
                              border: UnderlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su dirección';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          // Botón de registro
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _register,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.app_registration,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 6),
                                  Text("Registrarse", style: txtBtnEstilo),
                                ],
                              ),
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
