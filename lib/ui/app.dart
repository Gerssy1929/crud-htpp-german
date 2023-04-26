import 'package:crud_http/ui/auth/login.dart';
import 'package:crud_http/ui/auth/register.dart';
import 'package:crud_http/ui/content/students/crear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'content/students/actu.dart';
import 'content/students/listaStudent.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Usando HTTP',
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/listaStudent": (context) => const ListStudent(),
        "/registroStudent": (context) => const CrearStudent(),
        "/actuStudent": (context) => const ActualizarStudent()
      },
    );
  }
}
