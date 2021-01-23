import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/model_shops.dart';
import 'package:listar_flutter/screens/home/home_swiper.dart';
import 'package:listar_flutter/screens/product_detail_tab/product_detail_tab.dart';
import 'package:listar_flutter/api/api.dart';

class AppBarHomeSliver extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final int id;
  final List<ImageModel> banners;
  final List<ShopModel> shopModel;

  AppBarHomeSliver({this.id, this.shopModel,this.expandedHeight, this.banners});
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
      height: 10,
      color: Theme.of(context).scaffoldBackgroundColor,
    ),
    Container(
      height:125,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 3,
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(10),
              child:
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
                              hintText: "Search ",
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.only(
                              //       right: 10.0, left: 20.0),
                              //   child: DropPage(),

                              //   //removed dropdown
                              // ),
                            ),
                          ),
                          // ignore: non_constant_identifier_names
                          suggestionsCallback: (Pattern) async {
                            ////hardcoded datas
                            List<ShopModel> list = shopModel;
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetailTab(id:suggestion.id);
                            }));
                          })

                      // previous search by sanjana search.txt
                      ),
                      // Container(child:Text("shdui")),
            ),
            Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child:DropPage()
      //      Wrap(
      // children: shopModel.map(
      //   (item) {
      //     return DropPage(id:item.id,);
      //       },
      //     ).toList()
    
      //   ),
            )
          ],
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
  // final num id;

  // const DropPage({Key key, this.id}) : super(key: key);
  @override
  _DropPageState createState() => _DropPageState();
}

// added a dropdown for category selection @sanjana
class _DropPageState extends State<DropPage> {
  var dropdownValue ;
    List<CategoryModel2> _categoryList = [];
        List<ShopModel> _categoryshops = [];

   @override
  void initState() {
    _loadCategoryList();
    // _loadSearchResults();
    super.initState();
  }

  Future<void> _loadCategoryList() async {
    final List<CategoryModel2> result = await Api.getCategoryList();
    setState(() {
      _categoryList = result;
    });
    // print('category list *************:${_categoryList.length}');
  }

  //   Future<void> _loadSearchResults() async {
  //   final List<ShopModel> result = await Api.getSearchResult(id:widget.id);
  //   setState(() {
  //     _categoryshops = result;
  //   });
  //   // print('ShopModel list ************:${_shops.length}');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).hoverColor,
              // color: Theme.of(context).scaffoldBackgroundColor,
              // border: Border.all()
              ),
      child: Padding(
        padding: const EdgeInsets.only(left:10),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30,
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
          items: _categoryList
              .map<DropdownMenuItem<String>>((CategoryModel2 value) {
            return DropdownMenuItem<String>(
              value: value.title,
              child: Text(value.title),
            );
          }).toList(),
         
        ),
      ),
    );
  }
}
