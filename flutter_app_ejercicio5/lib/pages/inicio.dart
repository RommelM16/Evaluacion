/*import 'package:flutter/material.dart';

//Pantalla principal que utiliza StatefulWidget para permitir actualizaciones dinámicas.
class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage>
    with SingleTickerProviderStateMixin {
  //permite manejar animaciones

  //Variables de animación
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    //inicializa el controlador de animación y la animación de color.
    super.initState();

    // Inicializa el AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Duración de la animación
      vsync:
          this, //optimiza el rendimiento al prevenir el sobreconsumo de recursos,
    );

    // Crea un Tween para el color
    _colorAnimation = ColorTween(
      begin: Colors.white, // color inicial
      end: Colors.red, // Color final de la animación
    ).animate(_controller);

    // Inicia la animación y la repite
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controller
    super.dispose();
  }

  final TextStyle txtTituloEstilo = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    fontFamily: 'RocknRoll One',
    color: Colors.amber,
  );

  final TextStyle txtParrafoEstilo = const TextStyle(
    fontSize: 14,
    fontFamily: 'RocknRoll One',
    color: Color.fromARGB(255, 13, 35, 53),
  );

  final TextStyle txtSubTituloEstilo = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: 'RocknRoll One',
    color: Color.fromARGB(255, 13, 35, 53),
  );

  final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context)
                .openDrawer(); // Abre el Drawer al presionar el ícono
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Ver perfil'),
              onTap: () {
                // Aquí se puede agregar la lógica para navegar al perfil
                Navigator.pop(context); // Cierra el Drawer
                print('Ver perfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () {
                // Aquí se puede agregar la lógica para cerrar sesión
                Navigator.pop(context); // Cierra el Drawer
                print('Cerrar sesión');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Bienvenido a EsenTICs", style: txtTituloEstilo),
              const SizedBox(height: 10),
              Image.asset('images/1.png', width: 300),
              const SizedBox(height: 10),
              Text(
                "Transformamos tus ideas en soluciones tecnológicas. \nEn EsenTICs, nos especializamos en desarrollo de software a medida y soporte técnico integral. Nuestro compromiso es brindarte un servicio de calidad que impulse la innovación y optimice tus procesos.",
                textAlign: TextAlign.center,
                style: txtParrafoEstilo,
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Text(
                    "¡Descubre cómo podemos ayudarte a alcanzar tus objetivos!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'RocknRoll One',
                      color: _colorAnimation.value,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "Nosotros"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text("Nosotros", style: txtBtnEstilo),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "Contactos"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.contact_mail,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text("Contactos", style: txtBtnEstilo),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "Productos"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.contact_mail,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Text("Computadoras", style: txtBtnEstilo),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "Ordenes"),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.person,
          size: 40,
          semanticLabel: "iniciar",
          color: Colors.blue,
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/auth/auth_service.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage>
    with SingleTickerProviderStateMixin {
  // Variables de animación
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Inicializa el AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Duración de la animación
      vsync: this, // Optimiza el rendimiento
    );

    // Crea un Tween para el color
    _colorAnimation = ColorTween(
      begin: Colors.white, // Color inicial
      end: Colors.red, // Color final de la animación
    ).animate(_controller);

    // Inicia la animación y la repite
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controller
    super.dispose();
  }

  // Estilos de texto
  final TextStyle txtTituloEstilo = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    fontFamily: 'RocknRoll One',
    color: Colors.amber,
  );

  final TextStyle txtParrafoEstilo = const TextStyle(
    fontSize: 14,
    fontFamily: 'RocknRoll One',
    color: Color.fromARGB(255, 13, 35, 53),
  );

  final TextStyle txtSubTituloEstilo = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: 'RocknRoll One',
    color: Color.fromARGB(255, 13, 35, 53),
  );

  final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: <Widget>[
          // Usamos actions para colocar el icono a la derecha
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.manage_accounts, size: 40),
                onPressed: () {
                  Scaffold.of(context)
                      .openEndDrawer(); // Abre el Drawer al presionar el ícono
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(),
                child: Text(
                  'Cuenta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "Perfil");
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar sesión'),
              onTap: () async {
                Navigator.pop(context); // Cierra el Drawer

                // Llamamos al servicio para cerrar sesión
                await AuthService().signOut();

                // Redirigimos a la pantalla de login
                Navigator.pushReplacementNamed(context, 'Login2');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Bienvenido a EsenTICs", style: txtTituloEstilo),
              const SizedBox(height: 10),
              Image.asset('images/1.png', width: 300),
              const SizedBox(height: 10),
              Text(
                "Transformamos tus ideas en soluciones tecnológicas. \nEn EsenTICs, nos especializamos en desarrollo de software a medida y soporte técnico integral. Nuestro compromiso es brindarte un servicio de calidad que impulse la innovación y optimice tus procesos.",
                textAlign: TextAlign.center,
                style: txtParrafoEstilo,
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Text(
                    "¡Descubre cómo podemos ayudarte a alcanzar tus objetivos!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'RocknRoll One',
                      color: _colorAnimation.value,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "Nosotros"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text("Nosotros", style: txtBtnEstilo),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "Contactos"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.contact_mail,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text("Contactos", style: txtBtnEstilo),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "Productos"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.laptop,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Text("Computadoras", style: txtBtnEstilo),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "Ordenes"),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.shopping_cart,
          size: 40,
          semanticLabel: "iniciar",
          color: Colors.blue,
        ),
      ),
    );
  }
}
