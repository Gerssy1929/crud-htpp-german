import 'package:crud_http/data/services/peticionesStudent.dart';
import 'package:crud_http/domain/models/student.dart';
import 'package:get/get.dart';

import '../models/utiles.dart';

class ControlStudent extends GetxController {
  final Rxn<List<Student>> listaStudent = Rxn<List<Student>>([]);
  final Rxn<List<Mensajes>> listaCreados = Rxn<List<Mensajes>>([]);

  Future<void> crearStudent(
      String foto, String nombre, String ape, String pro, int iduser) async {
    listaCreados.value = await PeticionesStudent.registrarStudent(
        foto, nombre, ape, pro, iduser);
  }

  Future<void> getStudentGral() async {
    listaStudent.value = await PeticionesStudent.getListStudent();
  }

  Future<void> eliminarStudent(int id) async {
    listaCreados.value = await PeticionesStudent.eliminarStudent(id);
  }

  Future<void> actualizarStudent(
      int id, String foto, String nombre, String ape, String pro) async {
    listaCreados.value =
        await PeticionesStudent.actualizarStudent(id, foto, nombre, ape, pro);
  }

  List<Student>? get listaStudentGral => listaStudent.value;
  List<Mensajes>? get listaCreado => listaCreados.value;
}
