import 'package:flutter/material.dart';
import 'package:examen1_rdlb/utils/constants.dart' as con;

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
      backgroundColor: con.fondo4,
      body: Stack(
        children: [

          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo2,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo3,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo4,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo2,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo4,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: con.fondo3,
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
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
                  color: Colors.white.withOpacity(0.9),
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
                          style: TextStyle(color: con.botones),
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
                          String inputUser = user.text.trim();
                          String inputPass = pass.text.trim();

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
                      style: TextStyle(color: con.titulos),
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
