import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:listar_flutter/api/api.dart';
import 'package:listar_flutter/configs/config.dart';
import 'package:listar_flutter/models/model.dart';
import 'package:listar_flutter/models/screen_models/screen_models.dart';
import 'package:listar_flutter/screens/SearchResult/searchResult.dart';
import 'package:listar_flutter/utils/utils.dart';
import 'package:listar_flutter/widgets/widget.dart';
import 'package:shimmer/shimmer.dart';

import 'search_result_list.dart';
import 'search_suggest_list.dart';

class SearchHistory extends StatefulWidget {
  SearchHistory({Key key}) : super(key: key);

  @override
  _SearchHistoryState createState() {
    return _SearchHistoryState();
  }
}

class _SearchHistoryState extends State<SearchHistory> {
  SearchHistoryPageModel _historyPage;
  SearchHistorySearchDelegate _delegate = SearchHistorySearchDelegate();

  num id;
  String value;
  final _textController = TextEditingController();
  AutoCompleteTextField searchTextField;
  TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<CategoryModel2>> key = new GlobalKey();


  void _onSearch(String text) {
    if (text.isNotEmpty) {
    } else {}
  }

  @override
  void initState() {
    _loadData();
    _loadCategoryList();
    super.initState();
  }

  List<CategoryModel2> _categoryList;

 Future<void> _loadCategoryList() async {
    final List<CategoryModel2> result = await Api.getCategoryList();
    setState(() {
      _categoryList = result;
    });
    // print('category list *************:${_categoryList.length}');
  }
  ///Fetch API
  Future<void> _loadData() async {
    setState(() {
      _historyPage = null;
    });
    final ResultApiModel result = await Api.getHistorySearch();
    if (result.success) {
      setState(() {
        _historyPage = SearchHistoryPageModel.fromJson(result.data);
        _delegate = SearchHistorySearchDelegate();
      });
    }
  }

  Future<ProductModel> _onSearched() async {
    final ProductModel selected = await showSearch(
      context: context,
      delegate: _delegate,
    );
    return selected;
  }

  ///On navigate list product
  void _onProductList(TagModel item) {
    Navigator.pushNamed(
      context,
      Routes.listProduct,
      arguments: item.title,
    );
  }

  ///Build list tag
  List<Widget> _listTag(BuildContext context) {
    if (_historyPage?.tag == null) {
      return List.generate(6, (index) => index).map(
        (item) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).dividerColor,
            highlightColor: Theme.of(context).highlightColor,
            enabled: true,
            child: AppTag(
              Translate.of(context).translate('loading'),
              type: TagType.gray,
            ),
          );
        },
      ).toList();
    }

    return _historyPage.tag.map((item) {
      return InputChip(
        backgroundColor: Theme.of(context).buttonColor,
        deleteIconColor: Theme.of(context).canvasColor,
        onPressed: () {
          _onProductList(item);
        },
        label: Text(item.title,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
            )),
        onDeleted: () {
          _historyPage.tag.remove(item);
          setState(() {});
        },
      );
    }).toList();
  }

  ///Build popular
  List<Widget> _listPopular() {
    if (_historyPage?.popular == null) {
      return List.generate(8, (index) => index).map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 100,
              height: 100,
              child: AppProductItem(
                type: ProductViewType.cardSmall,
              ),
            ),
          );
        },
      ).toList();
    }

    return _historyPage.popular.map(
      (item) {
        return Padding(
          padding: EdgeInsets.only(right: 15),
          child: SizedBox(
            width: 100,
            height: 100,
            child: AppProductItem(
              item: item,
              type: ProductViewType.cardSmall,
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: AnimatedIcon(
        //     icon: AnimatedIcons.close_menu,
        //     progress: _delegate?.transitionAnimation,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // centerTitle: true,
        title: Text(Translate.of(context).translate('search_title')),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: _onSearch,
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.refresh),
        //     onPressed: _loadData,
        //   ),
        // ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Translate.of(context).translate('Search').toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // keyword search search bar
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hoverColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: AppTextInput(
                            hintText: Translate.of(context).translate('search'),
                            icon: Icon(Icons.search),
                            controller: _textController,
                            onSubmitted: _onSearch,
                            onTapIcon: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchResult(
                                        id: id, title: _textController.text)),
                              );
                            },
                            // onChanged: _onSearch,
                          ),

                          // // previous search by sanjana search.txt
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Translate.of(context)
                            .translate('Select Category')
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      // DropDown with suggestion
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Theme.of(context).hoverColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  autofocus: false,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: "Select a category",
                                    errorText: value,
                                  ),
                                ),

                                // ignore: non_constant_identifier_names
                                suggestionsCallback: (Pattern) async {
                                  List<CategoryModel2> list = _categoryList;
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
                                  setState(() {
                                    value = suggestion.title;
                                    id = suggestion.id;
                                  });
                                })

                            // previous search by sanjana search.txt
                            ),
                      ),
                    ],
                  ),
                  ///////////////////////Requered/////////////////////
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Text(
                  //       Translate.of(context)
                  //           .translate('Recent Searches')
                  //           .toUpperCase(),
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .subtitle1
                  //           .copyWith(fontWeight: FontWeight.w600),
                  //     ),
                  //     // recent
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Text(
                  //       Translate.of(context)
                  //           .translate('search_history')
                  //           .toUpperCase(),
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .subtitle1
                  //           .copyWith(fontWeight: FontWeight.w600),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         _historyPage.tag.clear();
                  //         setState(() {});
                  //       },
                  //       child: Text(
                  //         Translate.of(context).translate('clear'),
                  //         style: Theme.of(context).textTheme.subtitle2.copyWith(
                  //               color: Theme.of(context).accentColor,
                  //             ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // Wrap(
                  //   alignment: WrapAlignment.start,
                  //   spacing: 10,
                  //   children: _listTag(context),
                  // ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Text(
            //         Translate.of(context)
            //             .translate('recently_viewed')
            //             .toUpperCase(),
            //         style: Theme.of(context)
            //             .textTheme
            //             .subtitle1
            //             .copyWith(fontWeight: FontWeight.w600),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 120,
            //   child: ListView(
            //     padding: EdgeInsets.only(
            //       top: 10,
            //       left: 20,
            //       right: 5,
            //     ),
            //     scrollDirection: Axis.horizontal,
            //     children: _listPopular(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class SearchHistorySearchDelegate extends SearchDelegate<ProductModel> {
  SearchHistorySearchDelegate();

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    if (isDark) {
      return theme;
    }

    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestionList(query: query);
  }

  @override
  Widget buildResults(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return ResultList(query: query, statusBarHeight: statusBarHeight);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isNotEmpty) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
      ];
    }
    return null;
  }
}
