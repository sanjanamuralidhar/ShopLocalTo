import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listar_flutter/blocs/bloc.dart';
import 'package:listar_flutter/blocs/contactUs/bloc.dart';
import 'package:listar_flutter/blocs/signUp/bloc.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/main_navigation.dart';
import 'package:listar_flutter/screens/page1/page1.dart';
import 'package:listar_flutter/screens/screen.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/blocs/resetPassword/bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Routes route = Routes();

  ApplicationBloc _applicationBloc;
  LanguageBloc _languageBloc;
  ThemeBloc _themeBloc;
  AuthBloc _authBloc;
  LoginBloc _loginBloc;
  SearchBloc _searchBloc;
  SignUpBloc _signUpBloc;
  UpdateBloc _updateBloc;
  ResetBloc _resetBloc;
  ContactBloc _contactUsBloc;
  ChatBloc _chatBloc;

  @override
  void initState() {
    ///Bloc business logic
    _languageBloc = LanguageBloc();
    _themeBloc = ThemeBloc();
    _authBloc = AuthBloc();
    _loginBloc = LoginBloc(authBloc: _authBloc);
    _signUpBloc = SignUpBloc(authBloc: _authBloc);
    _updateBloc = UpdateBloc(authBloc: _authBloc);
    _resetBloc = ResetBloc(authBloc: _authBloc);
    _contactUsBloc = ContactBloc(authBloc: _authBloc);
    _applicationBloc = ApplicationBloc(
      authBloc: _authBloc,
      themeBloc: _themeBloc,
      languageBloc: _languageBloc,
    );
    _searchBloc = SearchBloc();
    _chatBloc = ChatBloc(authBloc: _authBloc);
    super.initState();
  }

  @override
  void dispose() {
    _applicationBloc.close();
    _languageBloc.close();
    _themeBloc.close();
    _authBloc.close();
    _loginBloc.close();
    _signUpBloc.close();
    _searchBloc.close();
    _updateBloc.close();
    _resetBloc.close();
    _contactUsBloc.close();
    _chatBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) => _applicationBloc,
        ),
        BlocProvider<LanguageBloc>(
          create: (context) => _languageBloc,
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => _themeBloc,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => _authBloc,
        ),
        BlocProvider<LoginBloc>(
          create: (context) => _loginBloc,
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => _signUpBloc,
        ),
        BlocProvider<UpdateBloc>(
          create: (context) => _updateBloc,
        ),
        BlocProvider<ResetBloc>(
          create: (context) => _resetBloc,
        ),
        BlocProvider<SearchBloc>(
          create: (context) => _searchBloc,
        ),
         BlocProvider<ContactBloc>(
          create: (context) => _contactUsBloc,
        ),
        BlocProvider<ChatBloc>(
          create: (context) => _chatBloc,
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, lang) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, theme) {
              return BlocBuilder<AuthBloc, AuthenticationState>(
                  builder: (context, auth) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  onGenerateRoute: route.generateRoute,
                  locale: AppLanguage.defaultLanguage,
                  localizationsDelegates: [
                    Translate.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: AppLanguage.supportLanguage,
                  home: BlocBuilder<ApplicationBloc, ApplicationState>(
                    builder: (context, app) {
                      print('mmmmmmmmmmmmmmmmmmmmlogincheck.............$app');
                      if (app is ApplicationSetupCompleted) {
                        return auth is AuthenticationSuccess
                            ? MainNavigation()
                            : auth is AuthenticationBeginCheck
                                ? Center(
                                    child: CircularProgressIndicator(
                                        backgroundColor: Colors.black,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Colors.blue[800])),
                                  )
                                :   Page1();
                      }
                      if (app is ApplicationIntroView) {
                        return IntroPreview();
                      }
                      return SplashScreen();
                    },
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
