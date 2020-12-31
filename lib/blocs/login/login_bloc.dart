import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/blocs/authentication/bloc.dart';
import 'package:listar_flutter/blocs/login/bloc.dart';
import 'package:listar_flutter/models/model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;

  LoginBloc({
    @required this.authBloc,
  }) : assert(authBloc != null);

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(event) async* {
    ///Event for login
    if (event is OnLogin) {
      ///Notify loading to UI
      yield LoginLoading();

      await Future.delayed(Duration(seconds: 10));

      ///Fetch API
      final dynamic result = await Api.login(
        email: event.email,
        password: event.password,
        
      );
      print('event.username at login bloc:${event.email}');
      print('event.password at login bloc:${event.password}');
      dynamic token = result['access_token'];
      FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
      flutterSecureStorage.write(key: 'token', value: token);

      print('result is result access_token:$token');

      ///Case API fail but not have token
      if (result['access_token']!=null) {
        ///Login API success
        final UserModel user = UserModel.fromJson(result);
        try {
          ///Begin start AuthBloc Event AuthenticationSave
          authBloc.add(AuthenticationSave(user));

          ///Notify loading to UI
          yield LoginSuccess();
        } catch (error) {
          ///Notify loading to UI
          yield LoginFail(error.toString());
        }
      } else {
        ///Notify loading to UI
        yield LoginFail(result['message']);
        
        print('login attempt result failed: $result');
      }
    }

    ///Event for logout
    if (event is OnLogout) {
      yield LogoutLoading();
      try {
        ///Begin start AuthBloc Event OnProcessLogout
        authBloc.add(AuthenticationClear());

        ///Notify loading to UI
        yield LogoutSuccess();
      } catch (error) {
        ///Notify loading to UI
        yield LogoutFail(error.toString());
      }
    }
  }
}
