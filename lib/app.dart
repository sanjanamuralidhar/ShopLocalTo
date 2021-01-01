import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listar_flutter/blocs/bloc.dart';
import 'package:listar_flutter/blocs/signUp/bloc.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/main_navigation.dart';
import 'package:listar_flutter/screens/screen.dart';
import 'package:listar_flutter/utils/utils.dart';

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

  @override
  void initState() {
    ///Bloc business logic
    _languageBloc = LanguageBloc();
    _themeBloc = ThemeBloc();
    _authBloc = AuthBloc();
    _loginBloc = LoginBloc(authBloc: _authBloc);
    _signUpBloc = SignUpBloc(authBloc: _authBloc);
    _applicationBloc = ApplicationBloc(
      authBloc: _authBloc,
      themeBloc: _themeBloc,
      languageBloc: _languageBloc,
    );
    _searchBloc = SearchBloc();
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
        BlocProvider<SearchBloc>(
          create: (context) => _searchBloc,
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
                                : SignIn();
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
