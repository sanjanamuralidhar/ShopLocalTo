import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/model_neighbour.dart';
import 'package:listar_flutter/models/model_shops.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/screens/home/home_swiper.dart';
import 'package:listar_flutter/screens/product_detail/product_detail.dart';
import 'package:listar_flutter/screens/product_detail_tab/product_detail_tab.dart';
import 'package:listar_flutter/utils/utils.dart';

class AppBarHomeSliver extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final List<ImageModel> banners;

  AppBarHomeSliver({this.expandedHeight, this.banners});
  String dropdownValue = 'One';
  ProductModel _page;
  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: HomeSwipe(
            images: banners,
            height: expandedHeight,
          ),
        ),
        
        Container(
          height: 30,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Card(
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, Routes.searchHistory);
                  },
                  child: Container(
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
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, left: 20.0),
                                child: DropPage(),

                                //removed dropdown
                              ),
                            ),
                          ),
                          suggestionsCallback: (Pattern) async {
                            List<ShopModel> list = shopModels;
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
                              leading: Icon(Icons.location_city),
                              title: Text(suggestion.title),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetailTab(id:suggestion.id);
                            }));
                          })

                      // previous search by sanjana search.txt
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class DropPage extends StatefulWidget {
  @override
  _DropPageState createState() => _DropPageState();
}

// added a dropdown for category selection @sanjana
class _DropPageState extends State<DropPage> {
  String dropdownValue = "All category";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          .copyWith(fontWeight: FontWeight.w500),
      underline: Container(
        height: 2,
        // color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['All category', 'Shops', 'Restaurants', 'Hotels']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
