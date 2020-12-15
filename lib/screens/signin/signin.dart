import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listar_flutter/blocs/bloc.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final _textIDController = TextEditingController();
  final _textPassController = TextEditingController();
  final _focusID = FocusNode();
  final _focusPass = FocusNode();

  LoginBloc _loginBloc;
  bool _showPassword = false;
  String _validID;
  String _validPass;
  bool setlogin=true;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _textIDController.text = "test";
    _textPassController.text = "123456";
    super.initState();
  }

  ///On navigate forgot password
  void _forgotPassword() {
    Navigator.pushNamed(context, Routes.forgotPassword);
  }

  ///On navigate sign up
  void _signUp() {
    Navigator.pushNamed(context, Routes.signUp);
  }

  ///On login
  void _login() {
    UtilOther.hiddenKeyboard(context);
    setState(() {
      _validID = UtilValidator.validate(data: _textIDController.text);
      _validPass = UtilValidator.validate(data: _textPassController.text);
      print(_validPass);
    });
    if (_validID == null && _validPass == null) {
      _loginBloc.add(OnLogin(
        username: _textIDController.text,
        password: _textPassController.text,
      )
      );
      print(_validPass);
    }
  }

  ///On show message fail
  Future<void> _showMessage(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message, style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('Login'),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(Images.ShopLocalTOLogo,width: 300, height: 200),
                SizedBox(height:30),
                AppTextInput(
                  hintText: Translate.of(context).translate('account'),
                  errorText: _validID != null
                      ? Translate.of(context).translate(_validID)
                      : null,
                  icon: Icon(Icons.clear),
                  controller: _textIDController,
                  focusNode: _focusID,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    setState(() {
                      _validID = UtilValidator.validate(
                        data: _textIDController.text,
                      );
                    });
                  },
                  onSubmitted: (text) {
                    UtilOther.fieldFocusChange(context, _focusID, _focusPass);
                  },
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textIDController.clear();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate('password'),
                  errorText: _validPass != null
                      ? Translate.of(context).translate(_validPass)
                      : null,
                  textInputAction: TextInputAction.done,
                  onChanged: (text) {
                    setState(() {
                      _validPass = UtilValidator.validate(
                        data: _textPassController.text,
                      );
                    });
                  },
                  onSubmitted: (text) {
                    _login();
                    print(setlogin);
                  },
                  onTapIcon: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  obscureText: !_showPassword,
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  controller: _textPassController,
                  focusNode: _focusPass,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, login) {
                    return BlocListener<LoginBloc, LoginState>(
                      listener: (context, loginListener) {
                        if (loginListener is LoginFail) {
                          _showMessage(loginListener.message);
                        }
                      },
                      child: AppButton(
                        onPressed: () {
                          _login();
                           print(setlogin);
                        },
                        text: Translate.of(context).translate('Login'),
                        loading: login is LoginLoading,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right:30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('No Account?'),
                        FlatButton(
                          onPressed: _signUp,
                          height: 10,
                          child: Text(
                            Translate.of(context).translate('Signup for free'),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right:30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Translate.of(context).translate('forgot you password?'),
                      ),
                      FlatButton(
                        height: 10,
                        onPressed: _forgotPassword,
                        child: Text(
                          Translate.of(context).translate('Reset'),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(Images.INDigitalLOGO_logo_large,width: 100, height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
