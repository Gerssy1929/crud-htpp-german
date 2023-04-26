import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  Widget build(BuildContext context) {
    ControlStudent controle = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Estudiantes"),
      ),
      body: ListView.builder(
        itemCount: controle.listaStudentGral!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(controle.listaStudentGral![index].foto),
            ),
            title: Text(
                "${controle.listaStudentGral![index].nombre} ${controle.listaStudentGral![index].apellido}"),
            subtitle: Text(controle.listaStudentGral![index].programa),
            trailing: (controle.listaStudentGral![index].idUser ==
                    controlu.listaUserLogin![0].id)
                ? PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Editar',
                        child: Text('Editar estudiante',
                            style: TextStyle(color: Colors.blue)),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Eliminar',
                        child: Text('Eliminar estudiante',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                    onSelected: (String value) {
                      // Aquí puedes implementar lo que deseas hacer cuando el usuario seleccione una opción
                      switch (value) {
                        case 'Editar':
                          Get.toNamed("/actuStudent", arguments: [
                            controle.listaStudentGral![index].id,
                            controle.listaStudentGral![index].foto,
                            controle.listaStudentGral![index].nombre,
                            controle.listaStudentGral![index].apellido,
                            controle.listaStudentGral![index].programa
                          ]);
                          break;
                        case 'Eliminar':
                          controle
                              .eliminarStudent(
                                  controle.listaStudentGral![index].id)
                              .then((value) {
                            Get.snackbar(
                                'Estudiantes', controle.listaCreado![0].mensaje,
                                duration: const Duration(seconds: 3),
                                icon: const Icon(Icons.info),
                                shouldIconPulse: true,
                                backgroundColor: Colors.yellow);
                          });
                          setState(() {
                            controle.listaStudentGral!.removeAt(index);
                          });
                          break;
                      }
                    },
                    icon: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  )
                : const Text(""),
          );
        },
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class Footer extends StatefulWidget {
  const Footer({
    super.key,
  });

  @override
  State<Footer> createState() => FooterState();
}

class FooterState extends State<Footer> {
  int pagina = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          pagina = index;
          if (pagina == 1) {
            Get.toNamed("/registroStudent");
          } else {
            Get.toNamed("/login");
          }
          pagina = index;
        });
      },
      currentIndex: pagina,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_rounded),
          label: "Añadir Estudiante",
        )
      ],
    );
  }
}
