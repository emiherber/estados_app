import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                usuarioService.removerUsuario();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: usuarioService.existeUsuario
          ? _InformacionUsuario(usuario: usuarioService.usuario)
          : const Center(
              child: Text('No hay usuario seleccionado'),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class _InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const _InformacionUsuario({required this.usuario, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'General',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ListTile(
          title: Text('Nombre: ${usuario.nombre}'),
        ),
        ListTile(
          title: Text('Edad: ${usuario.edad}'),
        ),
        const Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ...?usuario.profesiones?.map((e) => ListTile(title: Text(e))).toList()
      ]),
    );
  }
}
