import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listar_flutter/configs/image.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:listar_flutter/blocs/signUp/bloc.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/api/api.dart';

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
                          
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),),
                          filled:true,
                          fillColor: Theme.of(context).highlightColor,
                            hintText: Translate.of(context)
                                .translate('Select Location'),
                            suffix: PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_drop_down,color: Colors.grey,),
                              onSelected: (String value) {
                                _textLocationController.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return _locations.map<PopupMenuItem<String>>(
                                    (MyLocation value) {
                                  return new PopupMenuItem(
                                      child: new Text(value.name),
                                      value: value.name);
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
                  builder: (context, signup) {
                    return BlocListener<SignUpBloc, SignUpState>(
                      listener: (context, signupListener) {
                        if (signupListener is SignUpFail) {
                          print("signup failed");
                          Navigator.of(context).pop();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Signup Successful...!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Theme.of(context).buttonColor,
                              textColor: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 16.0);
                          Navigator.of(context).pop();
                          // Navigator.pushNamed(context, "signin");
                        }
                      },
                      child: AppButton(
                        onPressed: () {
                          _signUpBloc.add(OnSignUp(
                            username: _textIDController.text,
                            email: _textEmailController.text,
                            password: _textPassController.text,
                            phone: _textPhoneController.text,
                            location: _textLocationController.text,
                          ));
                          // _signUp();
                          print('username:${_textIDController.text}');
                          print('email:${_textEmailController.text}');
                          print('password:${_textPassController.text}');
                          print('phone:${_textPhoneController.text}');
                          print('location:${_textLocationController.text}');
                        },
                        text: Translate.of(context).translate('sign_up'),
                        loading: signup is SignUpLoading,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
                // AppButton(
                //   onPressed: () {
                //     _signUp();
                //     //  Navigator.pushNamed(context, Routes.success);
                //   },
                //   text: Translate.of(context).translate('sign_up'),
                //   loading: _loading,
                //   disableTouchWhenLoading: true,
                // ),
                SizedBox(
                  height: 30,
                ),
                // Image.asset(Images.INDigitalLOGO_logo_large,
                // width: 100, height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}