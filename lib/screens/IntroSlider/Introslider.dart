
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:listar_flutter/configs/image.dart';
import 'package:listar_flutter/configs/routes.dart';
import 'package:listar_flutter/screens/home/home.dart';

import '../../main_navigation.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}


class IntroScreenState extends State<IntroScreen> {
 List<Slide> slides = new List();

 @override
 void initState() {
   super.initState();

   slides.add(
     new Slide(
       title: "ERASER",
       description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
       pathImage: Images.Room4,
       backgroundColor: Color(0xfff5a623),
     ),
   );
   slides.add(
     new Slide(
       title: "PENCIL",
       description: "Ye indulgence unreserved connection alteration appearance",
       pathImage: Images.Room5,
       backgroundColor: Color(0xff203152),
     ),
   );
   slides.add(
     new Slide(
       title: "RULER",
       description:
       "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
       pathImage: Images.Room6,
       backgroundColor: Color(0xff9932CC),
     ),
   );
 }

 void onDonePress() {
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MainNavigation()),
  );
 }

 @override
 Widget build(BuildContext context) {
   return new IntroSlider(
     slides: this.slides,
     onDonePress: this.onDonePress,
   );
 }
}