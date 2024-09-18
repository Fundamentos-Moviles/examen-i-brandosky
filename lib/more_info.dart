import 'package:flutter/material.dart';
import 'package:examen1_rdlb/utils/constants.dart' as con;

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  List<Widget> recuadros = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  recuadros.add(Container(
                    height: 50,
                    width: 50,
                    color: con.efectos,
                    margin: const EdgeInsets.all(5.0),
                  ));
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: con.botones,
              ),
              child: const Text('Agregar recuadro'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Wrap(
                    children: recuadros.take(12).toList(), // Primeros 12 recuadros
                  ),
                  const SizedBox(height: 20),
                  // Subsecuentes grupos de recuadros en bloques de 12
                  if (recuadros.length > 12)
                    for (int i = 12; i < recuadros.length; i += 12)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Wrap(
                            children: recuadros
                                .skip(i)
                                .take(12)
                                .toList(), // Bloques adicionales de 12 recuadros
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
