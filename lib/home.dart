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
    lista = List.from(con.lista); // Copia mutable de la lista.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('NOMBRE COMPLETO'),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          final datos = lista[index].split('#');
          final id = int.parse(datos[0]);

          return ListTile(
            title: Text(datos[2]),
            subtitle: Text(datos[3]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    if ([10, 15, 20, 23].contains(id)) {
                      _showSnackBar(
                          context, 'El ID $id no se puede eliminar', 2);
                    } else {
                      setState(() {
                        lista.removeAt(index);
                        _showSnackBar(
                            context, 'Elemento con ID $id eliminado', 2);
                      });
                    }
                  },
                ),
                if (datos[5] == '1')
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/more_info');
                    },
                    child: const Text('Ver más'),
                  ),
              ],
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

