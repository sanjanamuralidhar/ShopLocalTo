import 'package:flutter/material.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/utils/translate.dart';
import 'package:listar_flutter/widgets/widget.dart';

class NeighbourInfo extends StatelessWidget {
final TabModel item;
final ProductDetailTabPageModel page;
final Function(ProductModel) onProductDetail;

  const NeighbourInfo({Key key, this.item, this.page, this.onProductDetail}) : super(key: key);
  
  @override
  
  // creating a dynamic tab bar sanjana 


  Widget build(BuildContext context) {
    switch (item.key) {
      case "All Category":
       return Container(
          key: item.keyContentItem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  top: 15,
                ),
                child: Text(
                  Translate.of(context).translate('featured'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    final ProductModel item = page?.product?.feature[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(right: 15),
                      child: AppProductItem(
                        onPressed: onProductDetail,
                        item: item,
                        type: ProductViewType.gird,
                      ),
                    );
                  },
                  itemCount: page.product.feature.length,
                ),
              ),
              Container(
                height: 15,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );

      case "Restaurants":
        return Container(
          key: item.keyContentItem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  top: 15,
                ),
                child: Text(
                  Translate.of(context).translate('featured'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    final ProductModel item = page?.product?.feature[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(right: 15),
                      child: AppProductItem(
                        onPressed: onProductDetail,
                        item: item,
                        type: ProductViewType.gird,
                      ),
                    );
                  },
                  itemCount: page.product.feature.length,
                ),
              ),
              Container(
                height: 15,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );

      case "Hotels":
        return Container(
          key: item.keyContentItem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  top: 15,
                ),
                child: Text(
                  Translate.of(context).translate('featured'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    final ProductModel item = page?.product?.feature[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(right: 15),
                      child: AppProductItem(
                        onPressed: onProductDetail,
                        item: item,
                        type: ProductViewType.gird,
                      ),
                    );
                  },
                  itemCount: page.product.feature.length,
                ),
              ),
              Container(
                height: 15,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      
      case "Events":
       return Container(
          key: item.keyContentItem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  top: 15,
                ),
                child: Text(
                  Translate.of(context).translate('featured'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    final ProductModel item = page?.product?.feature[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(right: 15),
                      child: AppProductItem(
                        onPressed: onProductDetail,
                        item: item,
                        type: ProductViewType.gird,
                      ),
                    );
                  },
                  itemCount: page.product.feature.length,
                ),
              ),
              Container(
                height: 15,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );

      default:
        return Container(
          key: item.keyContentItem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  top: 15,
                ),
                child: Text(
                  Translate.of(context).translate('featured'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: 20),
                  itemBuilder: (context, index) {
                    final ProductModel item = page?.product?.feature[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(right: 15),
                      child: AppProductItem(
                        onPressed: onProductDetail,
                        item: item,
                        type: ProductViewType.gird,
                      ),
                    );
                  },
                  itemCount: page.product.feature.length,
                ),
              ),
              Container(
                height: 15,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
  }
}
}
// its the normal Tab controller 
// DefaultTabController(  
//         length: 5,  
//         child: Scaffold(  
//           appBar: AppBar(  
//             actions: [
              
//             ],
//             title: Text('Flutter Tabs Demo'),  
//             bottom: TabBar(  
//               tabs: [  
//                 Tab(text: "All Ctegories"),  
//                 Tab(text: "Restaurants"),  
//                 Tab(text: "Hotels"),
//                 Tab(text: "Events"),
//                 Tab(text: "Fitness"),
//               ],  
//             ),  
//           ),  
//           body: TabBarView(  
//             children: [  
//                Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.ac_unit_sharp),
//               Icon(Icons.ac_unit), 
//               Icon(Icons.ac_unit_rounded), 


//             ],  
//           ),  
//         ),  
//       ),