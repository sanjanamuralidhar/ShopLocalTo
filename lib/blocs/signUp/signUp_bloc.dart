import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/blocs/authentication/bloc.dart';
import 'package:listar_flutter/blocs/signUp/bloc.dart';
import 'package:listar_flutter/models/model.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthBloc authBloc;

  SignUpBloc({
    @required this.authBloc,
  }) : assert(authBloc != null);

  @override
  SignUpState get initialState => InitialSignUpState();

  @override
  Stream<SignUpState> mapEventToState(event) async* {
    ///Event for login
    if (event is OnSignUp) {
      ///Notify loading to UI
      yield SignUpLoading();

      await Future.delayed(Duration(seconds: 1));

      ///Fetch API
      final dynamic result = await Api.signup(
        email: event.email,
        password: event.password,
        phone: event.phone,
        location: event.location
      );

      ///Case API fail but not have token
      if (result['status']!=null) {
        ///Login API success
        final UserModel user = UserModel.fromJson(result);
print('signup success');
        try {
          ///Begin start AuthBloc Event AuthenticationSave
          authBloc.add(AuthenticationSave(user));

          ///Notify loading to UI
          yield SignUpSuccess();
        } catch (error) {
          ///Notify loading to UI
          yield SignUpFail(error.toString());
        }
      } else {
        ///Notify loading to UI
        yield SignUpFail('signup failed');
      }
    }

    ///Event for logout
    if (event is OnSignOut) {
      yield SignOutLoading();
      try {
        ///Begin start AuthBloc Event OnProcessLogout
        authBloc.add(AuthenticationClear());

        ///Notify loading to UI
        yield SignOutSuccess();
      } catch (error) {
        ///Notify loading to UI
        yield SignOutFail(error.toString());
      }
    }
  }
}
