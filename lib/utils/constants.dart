import 'package:flutter/material.dart';

const Color fondo = Color(0xff520120);
const Color fondo2 = Color(0xff64011f);
const Color fondo3 = Color(0xff41011a);
const Color fondo4 = Color(0xffb20222);
const Color titulos = Color(0xff948800);
const Color botones = Color(0xffa65476);
const Color efectos = Color(0xff919b02);

// Estructura simple sin Map
class Examen {
  final int id;
  final int numero;
  final String titulo;
  final String descripcion;
  final int estrellas;

  Examen(this.id, this.numero, this.titulo, this.descripcion, this.estrellas);
}

// Lista de elementos de examen
final List<Examen> lista = [

];
