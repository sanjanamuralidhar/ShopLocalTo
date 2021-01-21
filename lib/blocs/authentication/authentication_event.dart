import 'package:listar_flutter/models/model.dart';

abstract class AuthenticationEvent {}

class AuthenticationCheck extends AuthenticationEvent {
}

class AuthenticationSave extends AuthenticationEvent {
  final UserModel user;

  AuthenticationSave(this.user);
}

class AuthenticationClear extends AuthenticationEvent {}
class AuthenticationSignupSave extends AuthenticationEvent {
  final UserModel user;

  AuthenticationSignupSave(this.user);
}
class AuthenticationUpdateSave extends AuthenticationEvent {
  final UserModel user;

  AuthenticationUpdateSave(this.user);
}
class AuthenticationResetSave extends AuthenticationEvent {
  final UserModel user;

  AuthenticationResetSave(this.user);
}