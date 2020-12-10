import 'package:flutter/material.dart';
import 'package:listar_flutter/configs/image.dart';
import 'package:listar_flutter/configs/routes.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final _textIDController = TextEditingController();
  final _textPassController = TextEditingController();
  final _textEmailController = TextEditingController();
  final _textLocationController = TextEditingController();
  final _textPhoneController = TextEditingController();
  final _focusID = FocusNode();
  final _focusPass = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPhone = FocusNode();
  final _focusLocation = FocusNode();

  bool _loading = false;
  bool _showPassword = false;
  String _validID;
  String _validPass;
  String _validEmail;
  String _validPhone;
  String _validLocation;

  ///On sign up
  void _signUp() {
    setState(() {
      _validID = UtilValidator.validate(
        data: _textIDController.text,
      );
      _validPass = UtilValidator.validate(
        data: _textPassController.text,
      );
      _validEmail = UtilValidator.validate(
        data: _textEmailController.text,
        type: Type.email,
      );
      _validPhone = UtilValidator.validate(
          data: _textPhoneController.text, type: Type.phone);
      _validLocation = UtilValidator.validate(
          data: _textLocationController.text, type: Type.location);
    },
    );
   
    if (_validID == null && _validPass == null && _validEmail == null) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('sign_up'),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(Images.ShopLocalTOLogo, width: 300, height: 200),
                SizedBox(
                  height: 30,
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate('Your Email'),
                  errorText: _validEmail != null
                      ? Translate.of(context).translate(_validEmail)
                      : null,
                  focusNode: _focusEmail,
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textEmailController.clear();
                  },
                  onSubmitted: (text) {
                    _signUp();
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
                SizedBox(
                  height: 10,
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate(
                    'Password',
                  ),
                  errorText: _validPass != null
                      ? Translate.of(context).translate(_validPass)
                      : null,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    setState(() {
                      _validPass = UtilValidator.validate(
                        data: _textPassController.text,
                      );
                    });
                  },
                  onSubmitted: (text) {
                    UtilOther.fieldFocusChange(
                        context, _focusPass, _focusEmail);
                  },
                  onTapIcon: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  obscureText: !_showPassword,
                  icon: Icon(
                    _showPassword ? Icons.lock_open : Icons.lock_outline,
                  ),
                  controller: _textPassController,
                  focusNode: _focusPass,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate('phone'),
                  errorText: _validPhone != null
                      ? Translate.of(context).translate(_validPhone)
                      : null,
                  icon: Icon(Icons.clear),
                  controller: _textPhoneController,
                  focusNode: _focusPhone,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    setState(() {
                      _validPhone = UtilValidator.validate(
                        data: _textPhoneController.text,
                      );
                    });
                  },
                  onSubmitted: (text) {
                    UtilOther.fieldFocusChange(
                        context, _focusPhone, _focusPhone);
                  },
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textPhoneController.clear();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate('Select Location'),
                  errorText: _validLocation != null
                      ? Translate.of(context).translate(_validLocation)
                      : null,
                  icon: Icon(Icons.clear),
                  controller: _textLocationController,
                  focusNode: _focusLocation,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    setState(() {
                      _validLocation = UtilValidator.validate(
                        data: _textLocationController.text,
                      );
                    });
                  },
                  onSubmitted: (text) {
                    UtilOther.fieldFocusChange(
                        context, _focusLocation, _focusLocation);
                  },
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textLocationController.clear();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                AppButton(
                  onPressed: () {
                    _signUp();
                     Navigator.pushNamed(context, Routes.success);
                  },
                  text: Translate.of(context).translate('sign_up'),
                  loading: _loading,
                  disableTouchWhenLoading: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(Images.INDigitalLOGO_logo_large,
                    width: 100, height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
