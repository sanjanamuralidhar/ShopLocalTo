import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:listar_flutter/models/model_user.dart';
import 'package:listar_flutter/api/api.dart';

class ContactUs extends StatefulWidget {
  @override
  ContactUsState createState() => ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  final _initPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final _textNameController = TextEditingController();
  final _textEmailController = TextEditingController();
  final _textInfoController = TextEditingController();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusInfo = FocusNode();

  String _validName;
  String _validEmail;
  String _validInfo;
  UserModel _userData;

  @override
  void initState() {
    _loadProfile();
    _textNameController.text;
    _textEmailController.text;
    super.initState();
  }
   Future<void> _loadProfile() async {
    final UserModel result = await Api.getUserProfile();
      setState(() {
        _userData = result;
      });
       
  }

  ///On send
  Future<void> _send() async {
    UtilOther.hiddenKeyboard(context);
    setState(() {
      _validName = UtilValidator.validate(
        data: _textNameController.text,
      );
      _validEmail = UtilValidator.validate(
        data: _textEmailController.text,
        type: Type.email,
      );
      _validInfo = UtilValidator.validate(
        data: _textInfoController.text,
      );
    });
    if (_validName == null && _validEmail == null && _validInfo == null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
     _textNameController.text=_userData.name;
    _textEmailController.text=_userData.email;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Translate.of(context).translate('contact_us')),
        actions: <Widget>[
          FlatButton(
            child: Text(
              Translate.of(context).translate('send'),
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            onPressed: _send,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: GoogleMap(
                          initialCameraPosition: _initPosition,
                          myLocationEnabled: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Translate.of(context).translate('name'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      AppTextInput(
                        hintText: Translate.of(context).translate('input_name'),
                        errorText: _validName != null
                            ? Translate.of(context).translate(_validName)
                            : null,
                        focusNode: _focusName,
                        textInputAction: TextInputAction.next,
                        onTapIcon: () async {
                          await Future.delayed(Duration(milliseconds: 100));
                          _textNameController.clear();
                        },
                        onSubmitted: (text) {
                          UtilOther.fieldFocusChange(
                              context, _focusName, _focusEmail);
                        },
                        onChanged: (text) {
                          setState(() {
                            _validName = UtilValidator.validate(
                              data: _textNameController.text,
                            );
                          });
                        },
                        icon: Icon(Icons.clear),
                        controller: _textNameController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Translate.of(context).translate('email'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      AppTextInput(
                        hintText: Translate.of(context).translate(
                          'input_email',
                        ),
                        errorText: _validEmail != null
                            ? Translate.of(context).translate(_validEmail)
                            : null,
                        focusNode: _focusEmail,
                        textInputAction: TextInputAction.next,
                        onTapIcon: () async {
                          await Future.delayed(Duration(milliseconds: 100));
                          _textEmailController.clear();
                        },
                        onSubmitted: (text) {
                          UtilOther.fieldFocusChange(
                              context, _focusEmail, _focusInfo);
                        },
                        onChanged: (text) {
                          setState(() {
                            _validEmail = UtilValidator.validate(
                              data: _textEmailController.text,
                              type: Type.email,
                            );
                          });
                        },
                        icon: Icon(Icons.clear),
                        controller: _textEmailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Translate.of(context).translate('information'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      AppTextInput(
                        hintText: Translate.of(context).translate(
                          'input_information',
                        ),
                        errorText: _validInfo != null
                            ? Translate.of(context).translate(_validInfo)
                            : null,
                        focusNode: _focusInfo,
                        maxLines: 5,
                        onTapIcon: () async {
                          await Future.delayed(Duration(milliseconds: 100));
                          _textInfoController.clear();
                        },
                        onSubmitted: (text) {
                          _send();
                        },
                        onChanged: (text) {
                          setState(() {
                            _validInfo = UtilValidator.validate(
                              data: _textInfoController.text,
                              type: Type.email,
                            );
                          });
                        },
                        icon: Icon(Icons.clear),
                        controller: _textInfoController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
