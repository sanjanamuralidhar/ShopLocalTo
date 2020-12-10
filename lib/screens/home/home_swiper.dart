import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:listar_flutter/models/model.dart';
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                height: 30,
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  /*.popup required..*/
                },
                child: Text(
                  "neighbourhood",
                  style: TextStyle(fontSize: 13.0),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
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
          padding: const EdgeInsets.only(top: 24, left: 210),
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
// changed code _swipperbanner to widget
