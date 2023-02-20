import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? _InformacionUsuario(
                  usuario: usuarioService.usuario,
                )
              : const Center(
                  child: Text('No hay infromación del usuario'),
                );
        },
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

  const _InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

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
          title: Text('Edad: ${usuario.edad.toString()}'),
        ),
        const Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        const ListTile(
          title: Text('Profesión 1'),
        ),
        const ListTile(
          title: Text('Profesión 2'),
        ),
        const ListTile(
          title: Text('Profesión 3'),
        ),
      ]),
    );
  }
}
