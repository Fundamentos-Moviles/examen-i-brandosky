import 'package:flutter/material.dart';
import 'package:examen1_rdlb/utils/constants.dart' as con;
import 'package:examen1_rdlb/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenedores para el fondo de colores
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: Container(color: con.fondo)),
                      Expanded(child: Container(color: con.fondo2)),
                      Expanded(child: Container(color: con.fondo3)),
                      Expanded(child: Container(color: con.fondo4)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      
                      Expanded(child: Container(color: con.fondo2)),
                      Expanded(child: Container(color: con.fondo)),
                      Expanded(child: Container(color: con.fondo4)),
                      Expanded(child: Container(color: con.fondo3)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.9), // Transparencia del fondo blanco
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: con.titulos,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: user,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Correo/Usuario',
                        fillColor: con.blanco,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Contraseña',
                        fillColor: con.blanco,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(color:con.botones),
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          String inputUser = user.text.trim();  // Eliminar espacios en blanco
                          String inputPass = pass.text.trim();  // Eliminar espacios en blanco

                          if (inputUser.isEmpty || inputPass.isEmpty) {
                            errorMessage = "Datos incompletos";
                          } else if (inputUser != "test" || inputPass != "FDM1") {
                            if (inputUser != "test") {
                              errorMessage = "Usuario incorrecto";
                            } else if (inputPass != "FDM1") {
                              errorMessage = "Contraseña incorrecta";
                            }
                          } else {
                            errorMessage = "";
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        });
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Mi primer examen, ¿estará sencillo?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
