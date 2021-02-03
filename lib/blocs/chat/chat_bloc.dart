import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/blocs/authentication/bloc.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final AuthBloc authBloc;

  ChatBloc({
    @required this.authBloc,
  }) : assert(authBloc != null);

  FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();

  @override
  ChatState get initialState => InitialChatState();

  @override
  Stream<ChatState> mapEventToState(event) async* {
    ///Event for login
    if (event is OnChat) {
      ///Notify loading to UI
      yield ChatLoading();

      await Future.delayed(Duration(seconds: 1));

      ///Fetch API
      final dynamic result = await Api.contactUs(
        username: event.name,
        email: event.email,
        comment: event.comment,
      );
      print('event.email at signup bloc:${event.email}');
      flutterSecureStorage.write(key: 'username', value: event.name);
      flutterSecureStorage.write(key: 'email', value: event.email);
      Future<String> value = flutterSecureStorage.read(key: 'email');
      print('/////////////////////////////');
      print(value.toString());

      @override
      // ignore: unused_element
      String toString() {
        return value.toString();
      }

      ///Case API fail but not have token
      if (result['status'] != null) {
        ///Login API success
        final UserModel user = UserModel.fromJson(result);
        print('update success');
        try {
          ///Begin start AuthBloc Event AuthenticationSave
          authBloc.add(AuthenticationChatSave(user));

          ///Notify loading to UI
          yield ChatSuccess();
        } catch (error) {
          ///Notify loading to UI
          yield ChatFail(error.toString());
        }
      } else {
        ///Notify loading to UI
        yield ChatFail('update failed');
      }
    }

    ///Event for logout
    if (event is AfterChat) {
      yield AfterChatLoading();
      try {
        ///Begin start AuthBloc Event OnProcessLogout
        authBloc.add(AuthenticationClear());

        ///Notify loading to UI
        yield AfterChatSuccess();
      } catch (error) {
        ///Notify loading to UI
        yield AfterChatFail(error.toString());
      }
    }
  }
}
