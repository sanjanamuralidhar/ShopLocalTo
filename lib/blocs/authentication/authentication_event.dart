import 'package:listar_flutter/models/model.dart';

abstract class AuthenticationEvent {}

class AuthenticationCheck extends AuthenticationEvent {}

class AuthenticationSave extends AuthenticationEvent {
  final UserModel user;

  AuthenticationSave(this.user);
}

class AuthenticationClear extends AuthenticationEvent {}
