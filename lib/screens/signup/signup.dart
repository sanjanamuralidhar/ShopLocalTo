import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listar_flutter/configs/image.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:listar_flutter/blocs/signUp/bloc.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/screens/signin/signin.dart';

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
  final _textLocationIdController = TextEditingController();
  final TextEditingController _controller = new TextEditingController();
  // ignore: unused_field
  final _focusID = FocusNode();
  final _focusPass = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPhone = FocusNode();
  final _focusLocation = FocusNode();

  bool _showPassword = false;
  String _validID;
  String _validPass;
  String _validEmail;
  String _validPhone;
  String _validLocation;
  List<MyLocation> _locations = [];
  String locationname;
  int locationid;
  FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();

  SignUpBloc _signUpBloc;
  var items = [
    'Working a lot harder',
    'Being a lot smarter',
    'Being a self-starter',
    'Placed in charge of trading charter'
  ];
  void initState() {
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
    _textIDController.text;
    _textPassController.text;
    _textEmailController.text;
    _textPhoneController.text;
    _textLocationController.text;
    _loadPopular();
    super.initState();
  }

  Future<void> _loadPopular() async {
    final List<MyLocation> result = await Api.getSuggestedLocation();
    setState(() {
      _locations = result;
    });
  }

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
                Text('Signup failed',
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

  Future<void> _showSuccess() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SignUp'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Thank You For SignUp!',
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Theme.of(context).buttonColor,
              child: Text('SignIn'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
            ),
          ],
        );
      },
    );
  }

  ///On sign up
  // void _signUp() {
  //   setState(
  //     () {
  //       _validID = UtilValidator.validate(
  //         data: _textIDController.text,
  //       );
  //       _validPass = UtilValidator.validate(
  //         data: _textPassController.text,
  //       );
  //       _validEmail = UtilValidator.validate(
  //         data: _textEmailController.text,
  //         // type: Type.email,
  //       );
  //       _validPhone = UtilValidator.validate(
  //         data: _textPhoneController.text,
  //         // type: Type.phone
  //       );
  //       _validLocation = UtilValidator.validate(
  //         data: _textLocationController.text,
  //         // type: Type.location
  //       );
  //       _signUpBloc.add(OnSignUp(
  //         email: _validEmail,
  //         password: _validPass,
  //         phone: _validPhone,
  //         location: _validLocation,
  //       ));
  //       print(_validEmail);
  //       // needed to navigate to signin page
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) => SignIn()),
  //       // );
  //     },
  //   );

  //   if (_validID == null &&
  //       _validPass == null &&
  //       _validEmail == null &&
  //       _validPhone == null &&
  //       _validLocation == null) {
  //     _signUpBloc.add(OnSignUp(
  //       email: _textEmailController.text,
  //       password: _textPassController.text,
  //       phone: _textPhoneController.text,
  //       location: _textLocationController.text,
  //     ));
  //     print('The value of the input is: $_textEmailController.text');
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => SignIn()),
  //     );
  //   }
  // }

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
                Image.asset(Images.ShopLocalTOLogo, width: 250, height: 150),
                SizedBox(
                  height: 30,
                ),
                AppTextInput(
                  hintText: Translate.of(context).translate('Full Name'),
                  errorText: _validID != null
                      ? Translate.of(context).translate(_validID)
                      : null,
                  icon: Icon(Icons.clear),
                  controller: _textIDController,
                  focusNode: _focusID,
                  textInputAction: TextInputAction.next,
                  // onChanged: (text) {
                  //   setState(() {
                  //     _validLocation = UtilValidator.validate(
                  //       data: _textLocationController.text,
                  //     );
                  //   });
                  // },
                  // onSubmitted: (text) {
                  //   UtilOther.fieldFocusChange(
                  //       context, _focusLocation, _focusLocation);
                  // },
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textIDController.clear();
                  },
                ),
                SizedBox(height: 10),
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
                  // onSubmitted: (text) {
                  //   _signUp();
                  // },
                  // onChanged: (text) {
                  //   setState(() {
                  //     _validEmail = UtilValidator.validate(
                  //       data: _textEmailController.text,
                  //       type: Type.email,
                  //     );
                  //   });
                  // },
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
                  // onChanged: (text) {
                  //   setState(() {
                  //     _validPass = UtilValidator.validate(
                  //       data: _textPassController.text,
                  //     );
                  //   });
                  // },
                  // onSubmitted: (text) {
                  //   _signUp();
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
                  // onChanged: (text) {
                  //   setState(() {
                  //     _validPhone = UtilValidator.validate(
                  //       data: _textPhoneController.text,
                  //     );
                  //   });
                  // },
                  // onSubmitted: (text) {
                  //   UtilOther.fieldFocusChange(
                  //       context, _focusPhone, _focusPhone);
                  // },
                  onTapIcon: () async {
                    await Future.delayed(Duration(milliseconds: 100));
                    _textPhoneController.clear();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // AppTextInput(
                //   hintText: Translate.of(context).translate('Select Location'),
                //   errorText: _validLocation != null
                //       ? Translate.of(context).translate(_validLocation)
                //       : null,
                //   icon: Icon(Icons.clear),
                //   controller: _textLocationController,
                //   focusNode: _focusLocation,
                //   textInputAction: TextInputAction.next,

                //   // onChanged: (text) {
                //   //   setState(() {
                //   //     _validLocation = UtilValidator.validate(
                //   //       data: _textLocationController.text,
                //   //     );
                //   //   });
                //   // },
                //   // onSubmitted: (text) {
                //   //   UtilOther.fieldFocusChange(
                //   //       context, _focusLocation, _focusLocation);
                //   // },
                //   onTapIcon: () async {
                //     await Future.delayed(Duration(milliseconds: 100));
                //     _textLocationController.clear();
                //   },
                // ),
                Padding(
                    padding: const EdgeInsets.only(left: 1, right: 1),
                    child: new Row(children: <Widget>[
                      new Expanded(
                          child: SizedBox(
                        height: 50,
                        child: new TextField(
                          controller: _textLocationController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  new BorderSide(color: Colors.grey[300]),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).highlightColor,
                            hintText: Translate.of(context)
                                .translate('Select Location'),
                            suffix: PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                              onSelected: (String value) {
                                _textLocationController.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return _locations.map<PopupMenuItem<String>>(
                                    (MyLocation value) {
                                  setState(() {
                                    locationname = value.title;
                                    locationid = value.id;
                                    flutterSecureStorage.write(key: 'location', value: locationname);
                                    flutterSecureStorage.write(key: 'locationid', value: locationid.toString());
                                  });
                                  return new PopupMenuItem(
                                    child: new Text(value.name),
                                    value: value.name,
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ),
                      )),
                      // new PopupMenuButton<String>(
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onSelected: (String value) {
                      //     _textLocationController.text = value;
                      //   },
                      //   itemBuilder: (BuildContext context) {
                      //     return _locations.map<PopupMenuItem<String>>((MyLocation value) {
                      //       return new PopupMenuItem(child: new Text(value.title), value: value.title);
                      //     }).toList();
                      //   },
                      // ),
                    ])),
                // **********important***************
                //              Column(
                //   children: _shops.map((item) {
                //     return Padding(
                //       padding: EdgeInsets.only(bottom: 15),
                //       child: AppProductItem(
                //         onPressshop: _onShopDetail,
                //         shopModel: item,
                //         type: ProductViewType.cardSmall,
                //       ),
                //     );
                //   }).toList(),
                // );
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),

                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, login) {
                    return BlocListener<SignUpBloc, SignUpState>(
                      listener: (context, loginListener) {
                        if (loginListener is SignUpFail) {
                          _showMessage(loginListener.message);
                        }
                        if (loginListener is SignUpSuccess) {
                          _showSuccess();
                          print('dknfdcvkfnvc');
                          // Navigator.of(context).pop();
                        }
                      },
                      child: AppButton(
                        onPressed: () {
                          setState(() {
                            _signUpBloc.add(
                              OnSignUp(
                                email: _textEmailController.text,
                                password: _textPassController.text,
                                location: _textLocationController.text,
                                phone: _textPhoneController.text,
                                username: _textIDController.text,
                              ),
                            );
                            print('email:${_textEmailController.text}');
                            print('password:${_textPassController.text}');
                          });
                        },
                        text: Translate.of(context).translate('SignUp'),
                        loading: login is SignUpLoading,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
