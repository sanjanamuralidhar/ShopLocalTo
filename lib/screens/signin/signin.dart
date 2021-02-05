import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:listar_flutter/blocs/bloc.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:listar_flutter/main_navigation.dart';

class SignIn extends StatefulWidget {
  final IconModel item;
  final ProductDetailTabPageModel page;
  SignIn({Key key, this.item, this.page}) : super(key: key);

  @override
  _SignInState createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final _textEmailController = TextEditingController();
  final _textPassController = TextEditingController();
  final _focusID = FocusNode();
  final _focusPass = FocusNode();

  LoginBloc _loginBloc;
  bool _showPassword = false;
  // String _validID;
  // String _validPass;
  // String _validEmail;
  bool setlogin = true;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _textEmailController.text;
    _textPassController.text;
    // _successAlert(context);
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
  // void _login() {
  //   UtilOther.hiddenKeyboard(context);
  //   setState(() {
  //     _validID = UtilValidator.validate(data: _textIDController.text);
  //     _validPass = UtilValidator.validate(data: _textPassController.text);
  //     _loginBloc.add(
  //       OnLogin(
  //         username: _validID,
  //         password: _validPass,
  //       ),
  //     );

  //     print(_validPass);
  //   });
  //   if (_validID == null && _validPass == null) {
  //     _loginBloc.add(
  //       OnLogin(
  //         username: _textIDController.text,
  //         password: _textPassController.text,
  //       ),
  //     );
  //     print(_validPass);
  //   }
  // }

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
                Text('login failed',
                    style: Theme.of(context).textTheme.bodyText1),
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

  void _performLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    print('login attempt: $username with $password');
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                Image.asset(Images.ShopLocalTOLogo, width: 250, height: 150),
                SizedBox(height: 10),
                //         TextFormField(controller: _usernameController,),
                // TextFormField(controller: _passwordController, obscureText: true,),
                // RaisedButton(
                //   onPressed: _performLogin,
                //   child: Text('Login'),
                // ),
                AppTextInput(
                  hintText: Translate.of(context).translate('email'),
                  // errorText: _validID != null
                  //     ? Translate.of(context).translate(_validID)
                  //     : null,
                  icon: Icon(Icons.clear),
                  controller: _textEmailController,
                  focusNode: _focusID,
                  textInputAction: TextInputAction.next,
                  // onChanged: (text) {
                  //   setState(() {
                  //     _validID = UtilValidator.validate(
                  //       data: _textIDController.text,
                  //     );
                  //   });
                  // },
                  // onSubmitted: (text) {
                  //   UtilOther.fieldFocusChange(context, _focusID, _focusPass);
                  // },
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textEmailController.clear();
                  },

                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate('password'),
                  // errorText: _validPass != null
                  //     ? Translate.of(context).translate(_validPass)
                  //     : null,
                  textInputAction: TextInputAction.done,
                  // onChanged: (text) {
                  //   setState(() {
                  //     _validPass = UtilValidator.validate(
                  //       data: _textPassController.text,
                  //     );
                  //   });
                  // },
                  // onSubmitted: (text) {
                  //   UtilOther.fieldFocusChange(context, _focusID, _focusPass);
                  //   // _login();
                  //   print(setlogin);
                  // },
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
                        if (loginListener is LoginSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainNavigation(),
                              ));
                        }
                      },
                      child: AppButton(
                        onPressed: () {
                          setState(() {
                            _loginBloc.add(
                              OnLogin(
                                email: _textEmailController.text,
                                password: _textPassController.text,
                              ),
                            );
                            print('email:${_textEmailController.text}');
                            print('password:${_textPassController.text}');
                          });
                          // _login();

                          print(setlogin);
                        },
                        text: Translate.of(context).translate('Login'),
                        loading: login is LoginLoading,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an Account Yet?"),
                        Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                                onTap: _signUp,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      Translate.of(context)
                                          .translate('sign_up'),
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontSize: 15)),
                                ))),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Translate.of(context)
                            .translate('Forgot Your Password?'),
                      ),
                      Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                              onTap: _forgotPassword,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  Translate.of(context).translate('Reset'),
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 15),
                                ),
                              ))),
                    ],
                  ),
                ),
                Text(
                  Translate.of(context).translate('Or'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  height: 45,
                  child: SignInButtonBuilder(
                    text: 'Sign in with Facebook',
                    image: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 5, top: 8, bottom: 8),
                      child: Image.asset('assets/socialicons/facebook.png'),
                    ),
                    onPressed: () {},
                    backgroundColor: Theme.of(context).buttonColor,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  height: 45,
                  child: SignInButtonBuilder(
                    text: 'Sign in with Google',
                    image: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 5, top: 8, bottom: 8),
                      child: Image.asset('assets/socialicons/google.png'),
                    ),
                    onPressed: () {},
                    backgroundColor: Colors.red[900],
                  ),
                )

                // Image.asset(Images.INDigitalLOGO_logo_large,width: 100, height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TextFormField(controller: _usernameController,),
//         TextFormField(controller: _passwordController, obscureText: true,),
//         RaisedButton(
//           onPressed: _performLogin,
//           child: Text('Login'),
//         )
//       ],
//     );
//   }

//   void _performLogin() {
//     String username = _usernameController.text;
//     String password = _passwordController.text;

//     print('login attempt: $username with $password');
//   }
// }
