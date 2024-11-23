import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/auth/LoginPage.dart';
import 'package:flutter_app_ejercicio3/database/database_helper.dart';
import 'package:flutter_app_ejercicio3/firebase_options.dart';
import 'package:flutter_app_ejercicio3/pages/contactos.dart';
import 'package:flutter_app_ejercicio3/pages/inicio.dart';
import 'package:flutter_app_ejercicio3/pages/mapboxscreen.dart';
import 'package:flutter_app_ejercicio3/pages/nosotros.dart';
import 'package:flutter_app_ejercicio3/pages/computadora_list.dart';
import 'package:flutter_app_ejercicio3/pages/ordenes.dart';
import 'package:flutter_app_ejercicio3/pages/perfil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); //Punto de entrada que inicializa la aplicación.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Configura el tema y las rutas.
      title: "EsenTICS",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          "Login2", //La propiedad initialRoute define la pantalla que se muestra al inicio.
      routes: {
        //Se difinen las rutas de navegación con sus respectivas páginas.
        "Login2": (BuildContext context) => LoginPage(),
        "Inicio": (BuildContext context) => const InicioPage(),
        "Nosotros": (BuildContext context) => const NosotrosPage(),
        "Contactos": (BuildContext context) => const ContactosPage(),
        "Perfil": (BuildContext context) => const PerfilPage(),
        "Productos": (BuildContext context) => const ComputadoraList(),
        "Mapa": (BuildContext context) => const MapboxScreen(),
        "Ordenes": (BuildContext context) => OrdenesPage(),
        
      },
    );
  }

}