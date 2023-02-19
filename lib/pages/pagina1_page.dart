import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: const _InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class _InformacionUsuario extends StatelessWidget {
  const _InformacionUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          'General',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(),
        ListTile(
          title: Text('Nombre: '),
        ),
        ListTile(
          title: Text('Edad: '),
        ),
        Text(
          'Profesiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(),
        ListTile(
          title: Text('Profesión 1'),
        ),
        ListTile(
          title: Text('Profesión 2'),
        ),
        ListTile(
          title: Text('Profesión 3'),
        ),
      ]),
    );
  }
}
