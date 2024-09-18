import 'package:flutter/material.dart';

const Color fondo = Color(0xff520120);
const Color fondo2 = Color(0xff64011f);
const Color fondo3 = Color(0xff41011a);
const Color fondo4 = Color(0xffb20222);
const Color titulos = Color(0xff948800);
const Color botones = Color(0xffa65476);
const Color efectos = Color(0xff919b02);

class Examen {
  final int id;
  final int numero;
  final String titulo;
  final String descripcion;
  final int estrellas;

  Examen(this.id, this.numero, this.titulo, this.descripcion, this.estrellas);
}
const List<String> listaExamen = [
  '17#17#Iniciar el examen, para poder ir a dormir tranquilo#Subir el examen antes de las 9 am del viernes#5',
  '18#18#Terminar y enviar mi examen para no reprobar#No quiero reprobar#4',
  '19#19#Revisar 36 examenes#Los alumnos tendrán todo lo que se les pidió#3',
  '20#20#Revisar tareas#Llenar la lista con las calificaciones#2',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];
