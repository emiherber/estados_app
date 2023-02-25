import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final UsuarioService usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario ? Text('Nombre: ${usuarioService.usuario.nombre}') : const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                List<String> profesiones = ['FullStack Developer', 'Conductor'];
                usuarioService.usuario = Usuario(nombre: 'Emiliano', edad: 28, profesiones: profesiones);
              }),
          MaterialButton(
              disabledColor: Colors.blueGrey,
              color: Colors.blue,
              onPressed: !usuarioService.existeUsuario
                  ? null
                  : () {
                      usuarioService.cambiarEdad(29);
                    },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              disabledColor: Colors.blueGrey,
              color: Colors.blue,
              onPressed: !usuarioService.existeUsuario ? null : () => usuarioService.agregarProfesion(),
              child: const Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ))
        ],
      )),
    );
  }
}
