import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listar_flutter/blocs/bloc.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroPreview extends StatefulWidget {
  IntroPreview({Key key}) : super(key: key);

  @override
  _IntroPreviewState createState() {
    return _IntroPreviewState();
  }
}

class _IntroPreviewState extends State<IntroPreview> {
  ApplicationBloc _applicationBloc;

  @override
  void initState() {
    _applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    super.initState();
  }

  ///On complete preview intro
  void _onCompleted() {
    _applicationBloc.add(OnCompletedIntro());
  }

  @override
  Widget build(BuildContext context) {
    ///List Intro view page model
    final List<Slide> pages = [
      new Slide(
       title: "MOONLIGHT",
       description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
       pathImage: Images.ShopLocalTOLogo,
       backgroundImage: Images.Room6,
     ),
     new Slide(
       title: "GOOGI",
       description: "Ye indulgence unreserved connection alteration appearance",
       pathImage: Images.ShopLocalTOLogo,
       backgroundImage: Images.Room5,
     ),
    new Slide(
       title: "fITNESS",
       description:
       "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
       pathImage: Images.ShopLocalTOLogo, 
       backgroundImage: Images.Trip6,
     ),
    ];

    ///Build Page
    return Scaffold(
      body: IntroSlider(
     onSkipPress: ()=> _onCompleted(),
     slides: pages,
     onDonePress: ()=>_onCompleted(),
   )
    );
  }
}

