import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:flutter_app_ejercicio3/pages/inicio.dart';
import 'register_screen.dart'; // Importamos la pantalla de registro

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  // Método para iniciar sesión
  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Si el formulario es válido, intentamos iniciar sesión
      User? user = await _authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);

      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const InicioPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error al iniciar sesión')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingresar sus credenciales')));
    }
  }

  final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/1.png',
                width: 200,
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
                      key: _formKey, // asociamos formulario con el GlobalKey
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
                          // Campo para la clave
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Clave',
                              border: UnderlineInputBorder(),
                            ),
                            obscureText: true, // Oculta el texto para la contraseña
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su clave';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 70),
                          // Botones de iniciar sesión y registrarse
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _login,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.login,
                                        color: Colors.blue,
                                      ), // Ícono para el botón de "Iniciar sesión"
                                      const SizedBox(width: 3),
                                      Text("Iniciar", style: txtBtnEstilo),
                      ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navegar a la pantalla de registro
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const RegisterPage()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.app_registration,
                                        color: Colors.blue,
                                      ), // Ícono para el botón de "Registrarse"
                                      const SizedBox(width: 3),
                                      Text("Registrarse", style: txtBtnEstilo),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
