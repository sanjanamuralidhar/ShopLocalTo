import 'package:flutter/material.dart';
import 'package:listar_flutter/models/model_neighbour.dart';
import 'package:listar_flutter/utils/translate.dart';
import 'package:listar_flutter/widgets/app_neighbour_info.dart';

class NeighbourhoodPage extends StatefulWidget {
  @override
  _NeighbourhoodPageState createState() => _NeighbourhoodPageState();
}

class _NeighbourhoodPageState extends State<NeighbourhoodPage> {
  Widget _buildBanner() {
    return Image.asset(
      "assets/images/trip.png",
      fit: BoxFit.cover,
    );
  }
  String value = "allCategory";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            actions: <Widget>[],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _buildBanner(),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      alignment: Alignment.topLeft,
                      // The text should be user location
                      child: Text('Brampton Info',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.black)),
                      // transform: Matrix4.rotationZ(0.1),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.map,
                          color: Colors.blue[800],
                        ),
                        // onPressed: _onLocation,
                      ),
                    ),
                    
                  ],
                ),
                _buildCategory("allCategory"),
                _buildCategory("restaurants"),
                _buildCategory("hotels"),
                _buildCategory("events"),
                _buildCategory("fitness")
              ],
            ),
          ),
          
        ],
      ),
    );
  }
  Widget _buildCategory(String value) {
if(value == "allCategory"){
return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              Translate.of(context).translate('All Categories'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) { 
                NeighbourModel neighbour = neighbourModels[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppNeighbourItem(
                    item: neighbour,
                    // onPressed: _onProductDetail,
                    // type: ProductViewType.gird,
                  ),
                );
              },
              itemCount: neighbourModels.length,
            ),
          )
        ],
      ),
    );
}
if(value == "restaurants"){
return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              Translate.of(context).translate('restaurants'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) { 
                NeighbourModel neighbour = neighbourModels[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppNeighbourItem(
                    item: neighbour,
                    // onPressed: _onProductDetail,
                    // type: ProductViewType.gird,
                  ),
                );
              },
              itemCount: neighbourModels.length,
            ),
          )
        ],
      ),
    );
}
if(value == "hotels"){
return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              Translate.of(context).translate('hotels'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) { 
                NeighbourModel neighbour = neighbourModels[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppNeighbourItem(
                    item: neighbour,
                    // onPressed: _onProductDetail,
                    // type: ProductViewType.gird,
                  ),
                );
              },
              itemCount: neighbourModels.length,
            ),
          )
        ],
      ),
    );
}
if(value == "events"){
return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              Translate.of(context).translate('events'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) { 
                NeighbourModel neighbour = neighbourModels[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppNeighbourItem(
                    item: neighbour,
                    // onPressed: _onProductDetail,
                    // type: ProductViewType.gird,
                  ),
                );
              },
              itemCount: neighbourModels.length,
            ),
          )
        ],
      ),
    );
}
if(value == "fitness"){
return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Text(
              Translate.of(context).translate('fitness'),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) { 
                NeighbourModel neighbour = neighbourModels[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(right: 15),
                  child: AppNeighbourItem(
                    item: neighbour,
                    // onPressed: _onProductDetail,
                    // type: ProductViewType.gird,
                  ),
                );
              },
              itemCount: neighbourModels.length,
            ),
          )
        ],
      ),
    );
}

return Container();
    
  }
}
