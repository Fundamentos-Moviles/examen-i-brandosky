import 'package:flutter/material.dart';
import 'package:examen1_rdlb/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> lista;

  @override
  void initState() {
    super.initState();
    lista = List.from(con.listaExamen); // Usar la lista de la constante en constants.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones de actividades'),
        centerTitle: true,
        backgroundColor: con.titulos,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: lista.length,
        itemBuilder: (context, index) {
          final datos = lista[index].split('#');
          final id = int.parse(datos[0]);
          final titulo = datos[2];
          final descripcion = datos[3];
          final estrellas = int.parse(datos[4]);

          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ID y título
                    Row(
                      children: [
                        Text(
                          id.toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: con.titulos,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            titulo,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Descripción
                    Text(
                      descripcion,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    // Sistema de estrellas
                    Row(
                      children: List.generate(
                        5,
                            (starIndex) => Icon(
                          Icons.star,
                          color: starIndex < estrellas ? Colors.amber : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Botones Ver más y Borrar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (id == 17 || id == 18 || id == 20)
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/more_info');
                            },
                            child: const Text('Ver más'),
                          ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            if ([10, 15, 20, 23].contains(id)) {
                              _showSnackBar(context, 'El ID $id no se puede eliminar', 2);
                            } else {
                              setState(() {
                                lista.removeAt(index);
                                _showSnackBar(context, 'Elemento con ID $id eliminado', 2);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String mensaje, int segundos) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: segundos),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
