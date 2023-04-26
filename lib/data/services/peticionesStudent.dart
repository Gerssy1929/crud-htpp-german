import 'dart:convert';

import 'package:crud_http/domain/models/student.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../../domain/models/utiles.dart';

class PeticionesStudent {
  static Future<List<Mensajes>> registrarStudent(
      String foto, String nombre, String ape, String pro, int iduser) async {
    var url = Uri.parse(
        "https://german1919.000webhostapp.com/prueba/agregarStudent.php");

    final response = await http.post(url, body: {
      'foto': foto,
      'nombre': nombre,
      'ape': ape,
      'pro': pro,
      'iduser': iduser.toString()
    });

    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>> eliminarStudent(int id) async {
    var url = Uri.parse(
        "https://german1919.000webhostapp.com/prueba/eliminarStudent.php");

    final response = await http.post(url, body: {'id': id.toString()});

    return compute(convertirAlista, response.body);
  }

  static Future<List<Mensajes>> actualizarStudent(
      int id, String foto, String nombre, String ape, String pro) async {
    var url = Uri.parse(
        "https://german1919.000webhostapp.com/prueba/actualizarStudent.php");

    final response = await http.post(url, body: {
      'id': id.toString(),
      'foto': foto,
      'nombre': nombre,
      'apellido': ape,
      'programa': pro
    });

    return compute(convertirAlista, response.body);
  }

  static Future<List<Student>> getListStudent() async {
    var url = Uri.parse(
        "https://german1919.000webhostapp.com/prueba/listaStudent.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static List<Student> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Student>((json) => Student.desdeJson(json)).toList();
  }
}
