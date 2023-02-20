import 'dart:async';

import 'package:estados_app/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario = Usuario(nombre: '', edad: -1);
  final StreamController<Usuario> _usuarioStreamController = StreamController<Usuario>.broadcast();

  Usuario get usuario => _usuario;

  bool get existeUsuario => (_usuario.nombre != '') ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
