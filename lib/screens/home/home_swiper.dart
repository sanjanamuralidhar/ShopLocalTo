import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/routes.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/screens/screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: must_be_immutable
class HomeSwipe extends StatefulWidget {
  HomeSwipe({
    Key key,
    @required this.images,
    this.height,
  }) : super(key: key);
  final double height;
  final List<ImageModel> images;
  // List<ShopModel> shops;
 List<MyLocation> myLocation;
  @override
  _HomeSwipeState createState() => _HomeSwipeState();
}

class _HomeSwipeState extends State<HomeSwipe> {
  // String location;
  // List<ShopModel> shops;
   List<MyLocation> myLocation;
  String value;
  String locationName;
  bool isSwitched = false;
  //  List<ShopModel> _shops = [];
    List<MyLocation> _myLocation = [];

@override
  void initState() {
    _loadShops();
    super.initState();
  }

  Future<void> _loadShops() async {
    final List<MyLocation> result = await Api.getPopular();
    setState(() {
      _myLocation = result;
    });
    print('ShopModel list ************:${_myLocation.length}');
  }

  FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  Future<dynamic> getLocation() async {	
    String location1;	
    bool isLoggedIn = await flutterSecureStorage.containsKey(key:'location');	
    print('isloggedin:$isLoggedIn');	
    if (isLoggedIn) {	
      String location = await flutterSecureStorage.read(key:'location');	
      location1 = location;	
      print('location:$location');	
    }	
    final nullable = location1.isEmpty ? null : location1;	
    value = nullable;	
    print('location2:$location1');	
  }

  

  @override
  Widget build(BuildContext context) {
   getLocation();
    if (value == null) {
      Text('novalue');
    }
    //new code to add button,icon,toggle
    return Stack(
      children: <Widget>[
        Container(child: _swipperBanner(context)),
        // InkWell(
        //   // onTap: (){

        //   // },
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 35, right: 20),
        //     child: Align(
        //       alignment: Alignment.topRight,
        //       child: InkWell(
        //         onTap: () => Navigator.pushNamed(context, Routes.productDetail,
        //             arguments: 11),
        //         //itemid should be the argument we will get it during login(location id)
        //         // Navigator.pushNamed(context, Routes.neighbourInfo,arguments: "Brampton"),
        //         child: Icon(
        //           Icons.info_outline,
        //           color: Colors.white,
        //           size: 30,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        _buildValue(context),
        // Padding(
        //   padding: const EdgeInsets.only(top: 30),
        //   child: Align(
        //     alignment: Alignment.topCenter,
        //     child: Switch(
        //       value: isSwitched,
        //       onChanged: (value) {
        //         setState(() {
        //           isSwitched = value;
        //           print(isSwitched);
        //         });
        //       },
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 42, left: 220),
        //   child: Text("10 km",
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 17,
        //           fontWeight: FontWeight.bold)),
        // ),
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

  Widget _buildValue(BuildContext context) {
      //  _loadShops();
    if (value == null) {
      return Shimmer.fromColors(
        child:Padding(
      padding: const EdgeInsets.only(top: 30, left: 10),
      child: Align(
          alignment: Alignment.topLeft,
          child: FlatButton(child: Text(""),
          onPressed: (){_openPopup(context,_myLocation);},),
    ),
        ),
        baseColor: Colors.white,
        highlightColor: Colors.white,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20),
      child: Align(
          alignment: Alignment.topLeft,
          child: FlatButton(
            height: 30,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Theme.of(context).buttonColor,
            textColor: Theme.of(context).selectedRowColor,
            onPressed: () {
              _openPopup(context,_myLocation);
            },
            child: Text(
              value,
              //  "Bloor West",
              style: TextStyle(fontSize: 13.0),
            ),
          )),
    );
  }
}

// openpopup sanjana old
//  _openPopup(context) {
//     Alert(
//         context: context,
//         title: "Neighbourhood",
//         content: Column(
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(
//                 icon: Icon(Icons.location_on),
//                 labelText: 'Enter a Location',
//                 border: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         errorBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//               ),
//             ),
//           ],
//         ),
//         buttons: [
//           DialogButton(
// color: Colors.blue[900],
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               "Select",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//           )
//         ]).show();
//   }

// changed code _swipperbanner to widget
// openpopup sanjana
_openPopup(context,List<MyLocation> mylocation) {
  
  Alert(
      context: context,
      title: "Neighbourhood",style: AlertStyle(titleStyle: TextStyle(color:Theme.of(context).primaryColor),),
      content: Column(children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).hoverColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  // enabled: enable,
                  onTap: () {},
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search by",
                  ),
                ),
                // ignore: non_constant_identifier_names
                suggestionsCallback: (Pattern) async {
                  // //hardcoded datas to be changed
                  List<MyLocation> list = mylocation;
                  var suggetionList = Pattern.isEmpty
                      ? null
                      : list
                          .where((e) => e.title
                              .toLowerCase()
                              .contains(Pattern.toLowerCase()))
                          .toList();

                  return suggetionList;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    // leading: Icon(Icons.location_city),
                    title: Text(suggestion.title),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LocationDetail(id: suggestion.id);
                  }));
                })

            // previous search by sanjana search.txt
            ),
      ]),
      buttons: [
        DialogButton(
          color: Theme.of(context).buttonColor,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
