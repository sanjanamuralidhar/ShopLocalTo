import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/blocs/bloc.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  LoginBloc _loginBloc;
  ProfilePageModel _profilePage;
  bool setProfile = true;
  String value;
  UserModel _userData;
  FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  final _controller = RefreshController(initialRefresh: false);
  final _textController = TextEditingController();

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    // _loadData();
    _loadProfile();
    super.initState();
  }
  // Fetch flutterSecureStoragedata
//   Future<dynamic> getLocation() async{
//   String name;
//     bool isLoggedIn = await flutterSecureStorage.containsKey(key:'username');
//     print('isloggedin:$isLoggedIn');
//     if(isLoggedIn){
//       String username = await flutterSecureStorage.read(key:'location');
//       name = username;
//       print('location:$username');
//     }
// final nullable = name.isEmpty?null:name;
// value=nullable;
// print('location2:$name');
//   }
  ///Fetch API
  // Future<void> _loadData() async {
  //   final ResultApiModel result = await Api.getProfile();
  //   if (result.success) {
  //     setState(() {
  //       _profilePage = ProfilePageModel.fromJson(result.data);
  //     });
  //   }
  // }
   Future<void> _loadProfile() async {
    final UserModel result = await Api.getUserProfile();
      setState(() {
        _userData = result;
      });
      print(".............................................${_userData.name}");
      return _userData;
       
  }

  ///On refresh list
  Future<void> _onRefresh() async {
    _loadProfile();
    await Future.delayed(Duration(seconds: 1));
    _controller.refreshCompleted();
  }


  ///On logout
  Future<void> _logout() async {
    _loginBloc.add(OnLogout());
  }

  ///Build profile UI
  Widget _buildProfile() {
    UserModel users = _userData == null?null:_userData;
    return AppUserInfo(
      user: users,
      onPressed: () {},
      type: AppUserType.information,
    );
  }


  ///On navigation
  void _onNavigate(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translate.of(context).translate('profile'),
        ),
      ),
      body: SafeArea(
        child: SmartRefresher(
           enablePullDown: true,
           enablePullUp: false,
           onRefresh: _onRefresh,
           controller: _controller,
           header: ClassicHeader(
             idleText:
                 Translate.of(context).translate('pull_down_refresh'),
             refreshingText: Translate.of(context).translate('refreshing'),
             completeText:
                 Translate.of(context).translate('refresh_completed'),
             releaseText:
                 Translate.of(context).translate('release_to_refresh'),
             refreshingIcon: SizedBox(
               width: 16.0,
               height: 16.0,
               child: CircularProgressIndicator(strokeWidth: 2),
             ),
           ),
           child: ListView(
             padding: EdgeInsets.only(
              top: 15,
             ),
             children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: Column(
                  children: <Widget>[
                    _buildProfile(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    AppListTitle(
                      title: Translate.of(context).translate(
                        'edit_profile',
                      ),
                      trailing: RotatedBox(
                        quarterTurns: UtilLanguage.isRTL() ? 2 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      onPressed: () {
                        _onNavigate(Routes.editProfile);
                      },
                    ),
                    AppListTitle(
                      title: Translate.of(context).translate(
                        'change_password',
                      ),
                      trailing: RotatedBox(
                        quarterTurns: UtilLanguage.isRTL() ? 2 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      onPressed: () {
                        _onNavigate(Routes.changePassword);
                      },
                    ),
                    AppListTitle(
                      title: Translate.of(context).translate('contact_us'),
                      onPressed: () {
                        _onNavigate(Routes.contactUs);
                      },
                      trailing: RotatedBox(
                        quarterTurns: UtilLanguage.isRTL() ? 2 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                    AppListTitle(
                      title: Translate.of(context).translate(
                        'about_us',
                      ),
                      onPressed: () {
                        _onNavigate(Routes.aboutUs);
                      },
                      trailing: RotatedBox(
                        quarterTurns: UtilLanguage.isRTL() ? 2 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                    AppListTitle(
                      title: Translate.of(context).translate('setting'),
                      onPressed: () {
                        _onNavigate(Routes.setting);
                      },
                      trailing: RotatedBox(
                        quarterTurns: UtilLanguage.isRTL() ? 2 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      border: false,
                    ),
                  ],
                ),
              )
             ],
           ),
         )
      ),
    );
  }
}
