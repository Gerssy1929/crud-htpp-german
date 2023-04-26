import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controllerStudent.dart';

class ActualizarStudent extends StatelessWidget {
  const ActualizarStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;

    final id = args[0];
    final fot = args[1];
    final nom = args[2];
    final ape = args[3];
    final pro = args[4];
    ControlStudent controlstu = Get.find();
    TextEditingController foto = TextEditingController();
    TextEditingController nombre = TextEditingController();
    TextEditingController apellido = TextEditingController();
    TextEditingController programa = TextEditingController();

    foto.text = fot;
    nombre.text = nom;
    apellido.text = ape;
    programa.text = pro;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/student.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Actualizar\nEstudiante",
              style: TextStyle(color: Colors.brown, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
              child: Column(children: [
                TextField(
                  controller: foto,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                    hintText: 'Foto',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                    hintText: 'nombre',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: apellido,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                    hintText: 'Apellido',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: programa,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                    hintText: 'Programa',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Actualizar',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            controlstu
                                .actualizarStudent(
                                    int.parse(id.toString()),
                                    foto.text,
                                    nombre.text,
                                    apellido.text,
                                    programa.text)
                                .then((value) {
                              Get.snackbar('Estudiantes',
                                  controlstu.listaCreado![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.blue);
                              controlstu.getStudentGral().then(
                                  (value) => Get.toNamed("/listaStudent"));
                            });
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Inicio',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
