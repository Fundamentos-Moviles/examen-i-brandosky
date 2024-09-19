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
    lista = List.from(con.listaExamen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.fondo4,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        flexibleSpace: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: con.blanco,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Notificaciones de actividades',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: con.titulos,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final datos = lista[index].split('#');
                  final id = int.parse(datos[0]);
                  final numero = datos[1];
                  final titulo = datos[2];
                  final descripcion = datos[3];
                  final estrellas = int.parse(datos[4]);

                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          numero,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
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
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          estrellas,
                                              (starIndex) => Icon(
                                            Icons.star,
                                            color: con.efectos,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (id % 2 == 0) // Solo los IDs pares tendrán los botones
                            const SizedBox(width: 10),
                          if (id % 2 == 0)
                            Column(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/more_info');
                                  },
                                  icon: const Icon(Icons.visibility),
                                  label: const Text('Ver más'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: con.botones,
                                    foregroundColor: con.blanco,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    if ([10, 15, 20, 23].contains(id)) {
                                      _showSnackBar(
                                          context,
                                          'El ID $id se elimino',
                                          2);
                                    } else {
                                      setState(() {
                                        lista.removeAt(index);
                                        _showSnackBar(
                                            context,
                                            'El ID $id eliminado',
                                            2);
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.delete),
                                  label: const Text('Borrar'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: con.botones,
                                    foregroundColor: con.blanco,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      Container(
                        height: 8.0,
                        color: con.fondo4,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'SEGUNDA VISTA: Brandon Rodriguez Diaz de Leon',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: con.titulos,
              ),
              textAlign: TextAlign.center,
            ),
          ],
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
