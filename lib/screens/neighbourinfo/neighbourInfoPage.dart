// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:listar_flutter/configs/image.dart';
// import 'package:listar_flutter/configs/routes.dart';
// import 'package:listar_flutter/models/model_shops.dart';
// import 'package:listar_flutter/models/screen_models/product_detail_page_model.dart';
// import 'package:listar_flutter/utils/translate.dart';
// import 'package:listar_flutter/widgets/app_neighbour_info.dart';

// class NeighbourhoodPage extends StatefulWidget {
//   final String title;

//   const NeighbourhoodPage({Key key, this.title="Brampton"}) : super(key: key);
//   @override
//   _NeighbourhoodPageState createState() => _NeighbourhoodPageState();
// }

// class _NeighbourhoodPageState extends State<NeighbourhoodPage> {
//   CameraPosition _initPosition;
//   Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
//    ProductDetailPageModel _detailPage;
//   Widget _buildBanner() {
//     return ListView(
//   scrollDirection: Axis.horizontal, // <-- Like so
//   children: <Widget>[
//     Container(
//       child: Image.asset(Images.Trip1,
//       // "assets/images/trip.png",
//       fit: BoxFit.cover,
//     )),
//     Container(
//       child: Image.asset(Images.Trip2,
//       // "assets/images/trip1.png",
//       fit: BoxFit.cover,
//     )
//     ),
//     Container(
//       child: Image.asset(Images.Trip3,
//       // "assets/images/trip2.png",
//       fit: BoxFit.cover,
//     )
//     ),
//     Container(
//       child: Image.asset(Images.Trip4,
//       // "assets/images/trip3.png",
//       fit: BoxFit.cover,
//     )
//     ),
//     Container(
//       child: Image.asset(Images.Trip5,
//       // "assets/images/trip4.png",
//       fit: BoxFit.cover,
//     )
//     ),
//   ],
// );
    
//   }
//   String value = "allCategory";
//   void _onLocation() {
//     Navigator.pushNamed(
//       context,
//       Routes.neighbourLocation,
//     );
//   }

//   //   void initState() {
//   //   _onLoadMap();
//   //   super.initState();
//   // }

//   // ///On load map
//   // void _onLoadMap() {
//   //   final MarkerId markerId = MarkerId("1");
//   //   final Marker marker = Marker(
//   //     markerId: markerId,
//   //     position: LatLng(100, 100),
//   //     infoWindow: InfoWindow(title: "brampton"),
//   //     onTap: () {},
//   //   );

//   //   setState(() {
//   //     _initPosition = CameraPosition(
//   //       target: LatLng(100, 100),
//   //       zoom: 14.4746,
//   //     );
//   //     _markers[markerId] = marker;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 200.0,
//             pinned: true,
//             actions: <Widget>[],
//             flexibleSpace: FlexibleSpaceBar(
//               collapseMode: CollapseMode.parallax,
//               background: _buildBanner(),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               children: <Widget>[
//                 // Row(
//                 //   children: [
//                 //     Container(
//                 //       padding: const EdgeInsets.only(left: 20.0),
//                 //       alignment: Alignment.topLeft,
//                 //       // The text should be user location
//                 //       child: Text('Brampton Info',
//                 //           style: Theme.of(context)
//                 //               .textTheme
//                 //               .headline6
//                 //               .copyWith(color: Colors.black)),
//                 //       // transform: Matrix4.rotationZ(0.1),
//                 //     ),
//                 //     Spacer(),
//                 //     Container(
//                 //       padding: const EdgeInsets.only(top:10,right:10),
//                 //       alignment: Alignment.topRight,
//                 //       child: IconButton(
//                 //         icon: Icon(
//                 //           Icons.map,
//                 //           color: Colors.blue[800],
//                 //         ),
//                 //         onPressed: _onLocation,
//                 //       ),
//                 //     ),
                    
                     
//                 //   ],
//                 // ),
//                 //  Row(children: [
//                 //     Container(
//                 //       padding: const EdgeInsets.only(left:20),
//                 //       alignment: Alignment.topRight,
//                 //       child: Text('urban neighbourhood, lot to explore',
//                 //           style: Theme.of(context)
//                 //               .textTheme
//                 //               .subtitle2
//                 //               .copyWith(color: Colors.black),
//                 //       ),
//                 //     ),
//                 //   ],),
//                 _buildInfo(),
//                 _buildCategory("allCategory"),
//                 _buildCategory("restaurants"),
//                 _buildCategory("hotels"),
//                 _buildCategory("events"),
//                 _buildCategory("fitness")
//               ],
//             ),
//           ),
          
//         ],
//       ),
//     );
//   }
// Widget _buildInfo(){
//   return Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             height: 60,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 20),
//               itemBuilder: (context, index) { 
//                 ShopModel neighbour = neighbourModels[index];
//                 return Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[

//                 Text(
//                   "Brampton",
//                   style: Theme.of(context)
//                     .textTheme
//                     .headline6
//                     .copyWith(fontWeight: FontWeight.w600),
//                 ),
//                  Padding(
//             padding: EdgeInsets.only(top: 10),
//           ),
//                Text(
//             "Urban oasis feature hiking & equestrian trails,plus city views,the Greek Theater and LA zoo",
//             style: Theme.of(context).textTheme.bodyText1.copyWith(height: 1.3),
//           ),
//               ],
//             ),
//           );
//               },
//               itemCount: neighbourModels.length,
//             ),
//           )
//         ],
//       ),
//     );
// }
//   Widget _buildCategory(String value) {
// if(value == "allCategory"){
// return Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 15,
//             ),
//             child: Text(
//               Translate.of(context).translate('All Categories'),
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Container(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 20),
//               itemBuilder: (context, index) { 
//                 ShopModel neighbour = shopModels[index];
//                 return Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   padding: EdgeInsets.only(right: 15),
//                   child: AppNeighbourItem(
//                     item: neighbour,
//                     // onPressed: _onProductDetail,
//                     // type: ProductViewType.gird,
//                   ),
//                 );
//               },
//               itemCount: shopModels.length,
//             ),
//           )
//         ],
//       ),
//     );
// }
// if(value == "restaurants"){
// return Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 15,
//             ),
//             child: Text(
//               Translate.of(context).translate('restaurants'),
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Container(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 20),
//               itemBuilder: (context, index) { 
//                 ShopModel neighbour = neighbourModels[index];
//                 return Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   padding: EdgeInsets.only(right: 15),
//                   child: AppNeighbourItem(
//                     item: neighbour,
//                     // onPressed: _onProductDetail,
//                     // type: ProductViewType.gird,
//                   ),
//                 );
//               },
//               itemCount: neighbourModels.length,
//             ),
//           )
//         ],
//       ),
//     );
// }
// if(value == "hotels"){
// return Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 15,
//             ),
//             child: Text(
//               Translate.of(context).translate('hotels'),
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Container(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 20),
//               itemBuilder: (context, index) { 
//                 ShopModel neighbour = neighbourModels[index];
//                 return Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   padding: EdgeInsets.only(right: 15),
//                   child: AppNeighbourItem(
//                     item: neighbour,
//                     // onPressed: _onProductDetail,
//                     // type: ProductViewType.gird,
//                   ),
//                 );
//               },
//               itemCount: neighbourModels.length,
//             ),
//           )
//         ],
//       ),
//     );
// }
// if(value == "events"){
// return Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 15,
//             ),
//             child: Text(
//               Translate.of(context).translate('events'),
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Container(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 20),
//               itemBuilder: (context, index) { 
//                 ShopModel neighbour = neighbourModels[index];
//                 return Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   padding: EdgeInsets.only(right: 15),
//                   child: AppNeighbourItem(
//                     item: neighbour,
//                     // onPressed: _onProductDetail,
//                     // type: ProductViewType.gird,
//                   ),
//                 );
//               },
//               itemCount: neighbourModels.length,
//             ),
//           )
//         ],
//       ),
//     );
// }
// if(value == "fitness"){
// return Padding(
//       padding: EdgeInsets.only(top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 15,
//             ),
//             child: Text(
//               Translate.of(context).translate('fitness'),
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Container(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 20),
//               itemBuilder: (context, index) { 
//                 ShopModel neighbour = neighbourModels[index];
//                 return Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   padding: EdgeInsets.only(right: 15),
//                   child: AppNeighbourItem(
//                     item: neighbour,
//                     // onPressed: _onProductDetail,
//                     // type: ProductViewType.gird,
//                   ),
//                 );
//               },
//               itemCount: neighbourModels.length,
//             ),
//           )
//         ],
//       ),
//     );
// }

// return Container();
    
//   }
// }
