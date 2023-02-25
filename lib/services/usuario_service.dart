import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario = Usuario(nombre: '', edad: 0);

  Usuario get usuario => _usuario;

  bool get existeUsuario => _usuario.edad != 0 ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = Usuario(nombre: '', edad: 0);
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario.profesiones!.add('Profesion ${_usuario.profesiones!.length + 1}');
    notifyListeners();
  }
}
