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
      appBar: AppBar(
        title: const Text('More Info'),
        backgroundColor: con.botones,
      ),
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
              child: ListView.builder(
                itemCount: (recuadros.length / 12).ceil(),
                itemBuilder: (context, index) {
                  final start = index * 12;
                  final end = (start + 12).clamp(0, recuadros.length);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: con.fondo4,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: recuadros.sublist(start, end),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
