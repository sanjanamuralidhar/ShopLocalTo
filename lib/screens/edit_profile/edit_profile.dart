

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listar_flutter/blocs/Update/bloc.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:listar_flutter/models/model_user.dart';
import 'package:listar_flutter/api/api.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  final _textNameController = TextEditingController();
  final _textEmailController = TextEditingController();
  final _textAddressController = TextEditingController();
  final _textWebsiteController = TextEditingController();
  final _textInfoController = TextEditingController();
  final _textPhoneController = TextEditingController();
  
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusAddress = FocusNode();
  final _focusWebsite = FocusNode();
  final _focusInfo = FocusNode();
  final _focusPhone = FocusNode();

  File _image;
  bool _loading = false;
  String _validName;
  String _validEmail;
  String _validAddress;
  String _validWebsite;
  String _validInfo;
  String _validPhone;
  UserModel _userData;
UpdateBloc _updateBloc;

  void initState() {
    _updateBloc = BlocProvider.of<UpdateBloc>(context);
    _textNameController.text ;
    _textEmailController.text;
    _textAddressController.text ;
    _textWebsiteController.text ;
    _textPhoneController.text;
    _loadProfile();
    super.initState();
  }
  ///On async get Image file
  Future _getImage() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }
  Future<void> _loadProfile() async {
    final UserModel result = await Api.getUserProfile();
      setState(() {
        _userData = result;
      });
       
  }

  ///On update image
  // Future<void> _update() async {
  //   UtilOther.hiddenKeyboard(context);
  //   setState(() {
  //     _validName = UtilValidator.validate(
  //       data: _textNameController.text,
  //     );
  //     _validEmail = UtilValidator.validate(
  //       data: _textEmailController.text,
  //       type: Type.email,
  //     );
  //     _validAddress = UtilValidator.validate(
  //       data: _textAddressController.text,
  //     );
  //     _validWebsite = UtilValidator.validate(
  //       data: _textWebsiteController.text,
  //     );
  //     _validInfo = UtilValidator.validate(
  //       data: _textInfoController.text,
  //     );
  //   });
  //   if (_validName == null &&
  //       _validEmail == null &&
  //       _validAddress == null &&
  //       _validWebsite == null &&
  //       _validInfo == null) {
  //     setState(() {
  //       _loading = true;
  //     });
  //     await Future.delayed(Duration(seconds: 1));
  //     Navigator.pop(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _textNameController.text = _userData.name ;
    _textEmailController.text =  _userData.email;
    _textInfoController.text = _userData.information;
    _textAddressController.text = _userData.address;
    _textWebsiteController.text = _userData.website;
    _textPhoneController.text = _userData.phone;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Translate.of(context).translate('edit_profile')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            child: _image == null
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // image: DecorationImage(
                                      //   fit: BoxFit.cover,
                                      //   image: NetworkImage(_userData.image),
                                      // ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: _getImage,
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
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
                    hintText: Translate.of(context).translate('name'),
                    errorText: _validName != null
                        ? Translate.of(context).translate(_validName)
                        : null,
                    focusNode: _focusName,
                    textInputAction: TextInputAction.next,
                    onTapIcon: () async {
                      await Future.delayed(Duration(milliseconds: 100));
                      _textNameController.clear();
                    },
                    // onSubmitted: (text) {
                    //   UtilOther.fieldFocusChange(
                    //     context,
                    //     _focusName,
                    //     _focusEmail,
                    //   );
                    // },
                    // onChanged: (text) {
                    //   setState(() {
                    //     _validName = UtilValidator.validate(
                    //       data: _textNameController.text,
                    //     );
                    //   });
                    // },
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
                    hintText: Translate.of(context).translate('email'),
                    errorText: _validEmail != null
                        ? Translate.of(context).translate(_validEmail)
                        : null,
                    focusNode: _focusEmail,
                    textInputAction: TextInputAction.next,
                    onTapIcon: () async {
                      await Future.delayed(Duration(milliseconds: 100));
                      _textEmailController.clear();
                    },
                    // onSubmitted: (text) {
                    //   UtilOther.fieldFocusChange(
                    //       context, _focusEmail, _focusAddress);
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
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      Translate.of(context).translate('phone'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
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
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      Translate.of(context).translate('address'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  AppTextInput(
                    hintText: Translate.of(context).translate('address'),
                    errorText: _validAddress != null
                        ? Translate.of(context).translate(_validAddress)
                        : null,
                    focusNode: _focusAddress,
                    textInputAction: TextInputAction.next,
                    onTapIcon: () async {
                      await Future.delayed(Duration(milliseconds: 100));
                      _textAddressController.clear();
                    },
                    // onSubmitted: (text) {
                    //   UtilOther.fieldFocusChange(
                    //     context,
                    //     _focusAddress,
                    //     _focusWebsite,
                    //   );
                    // },
                    // onChanged: (text) {
                    //   setState(() {
                    //     _validAddress = UtilValidator.validate(
                    //       data: _textAddressController.text,
                    //     );
                    //   });
                    // },
                    icon: Icon(Icons.clear),
                    controller: _textAddressController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      Translate.of(context).translate('website'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  AppTextInput(
                    hintText: Translate.of(context).translate('website'),
                    errorText: _validWebsite != null
                        ? Translate.of(context).translate(_validWebsite)
                        : null,
                    focusNode: _focusWebsite,
                    textInputAction: TextInputAction.next,
                    onTapIcon: () async {
                      await Future.delayed(Duration(milliseconds: 100));
                      _textWebsiteController.clear();
                    },
                    // onSubmitted: (text) {
                    //   UtilOther.fieldFocusChange(
                    //     context,
                    //     _focusWebsite,
                    //     _focusInfo,
                    //   );
                    // },
                    // onChanged: (text) {
                    //   setState(() {
                    //     _validAddress = UtilValidator.validate(
                    //       data: _textWebsiteController.text,
                    //     );
                    //   });
                    // },
                    icon: Icon(Icons.clear),
                    controller: _textWebsiteController,
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
                      'information',
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
                    // onSubmitted: (text) {
                    //   _update();
                    // },
                    // onChanged: (text) {
                    //   setState(() {
                    //     _validInfo = UtilValidator.validate(
                    //       data: _textInfoController.text,
                    //       type: Type.email,
                    //     );
                    //   });
                    // },
                    icon: Icon(Icons.clear),
                    controller: _textInfoController,
                  ),
                  Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
               child: BlocBuilder<UpdateBloc, UpdateState>(
                  builder: (context, update) {
                    return BlocListener<UpdateBloc, UpdateState>(
                      listener: (context, updateListener) {
                        if (updateListener is UpdateFail) {
                          print("update failed");
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: AppButton(
                        onPressed: () {
                          _updateBloc.add(OnUpdate(
                            username: _textNameController.text,
                            email: _textEmailController.text,
                            phone: _textPhoneController.text,
                            address: _textAddressController.text,
                            info: _textInfoController.text,
                            website: _textWebsiteController.text,
                          ));
                          // _signUp();
                          print('username.........:${_textNameController.text}');
                          print('email.........:${_textEmailController.text}');
                          print('Adress...........:${_textAddressController.text}');
                          print('phone....................:${_textPhoneController.text}');
                          print('website...............:${_textWebsiteController.text}');
                        },
                        text: Translate.of(context).translate('confirm'),
                        loading: update is UpdateLoading,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
               ),
          ],
        ),
      ),
    );
  }
}
