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
    lista = List.from(con.listaExamen); // Crea una copia mutable de la lista.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones de actividades'),
        backgroundColor: con.titulos,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            final datos = lista[index].split('#');
            final id = int.parse(datos[0]);
            final numero = datos[1];
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
                      // Contenedor de texto
                      Row(
                        children: [
                          Text(
                            numero,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          if (estrellas > 0)
                            Row(
                              children: List.generate(
                                estrellas,
                                    (starIndex) => const Icon(
                                  Icons.star,
                                  color: con.estrella,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        descripcion,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 12.0),
                      // Contenedor de botones
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (id % 2 == 0) // Solo los IDs pares tendrán el botón de "Ver más"
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
