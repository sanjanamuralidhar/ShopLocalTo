import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:listar_flutter/configs/routes.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';

class HomeSwipe extends StatefulWidget {
  HomeSwipe({
    Key key,
    @required this.images,
    this.height,
  }) : super(key: key);
  final double height;
  final List<ImageModel> images;

  @override
  _HomeSwipeState createState() => _HomeSwipeState();
}

class _HomeSwipeState extends State<HomeSwipe> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    //new code to add button,icon,toggle
    return Stack(
      children: <Widget>[
        Container(child: _swipperBanner(context)),
        InkWell(
          onTap: (){
            // Navigate to neighbourhood information page
          },
                  child: Padding(
            padding: const EdgeInsets.only(top: 25,right:20),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.productDetail,arguments: 11) ,
                //itemid should be the argument we will get it during login(location id)
                // Navigator.pushNamed(context, Routes.neighbourInfo,arguments: "Brampton"),
                              child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20,left:10),
          child: Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                height: 30,
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  _openPopup(context);
                },
                child: Text(
                  "neighbourhood",
                  style: TextStyle(fontSize: 13.0),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 210),
          child: Text("10 km",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  Widget _swipperBanner(BuildContext context) {
    if (widget.images.length > 0) {
      return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            widget.images[index].image,
            fit: BoxFit.cover,
          );
        },
        autoplayDelay: 3000,
        autoplayDisableOnInteraction: false,
        autoplay: true,
        itemCount: widget.images.length,
        pagination: SwiperPagination(
          alignment: Alignment(0.0, 0.4),
          builder: SwiperPagination.dots,
        ),
      );
    }
    return Shimmer.fromColors(
      baseColor: Theme.of(context).hoverColor,
      highlightColor: Theme.of(context).highlightColor,
      enabled: true,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
 _openPopup(context) {
    Alert(
        context: context,
        title: "Neighbourhood",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.location_on),
                labelText: 'Enter a Location',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
color: Colors.blue[900],
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Select",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
// changed code _swipperbanner to widget
