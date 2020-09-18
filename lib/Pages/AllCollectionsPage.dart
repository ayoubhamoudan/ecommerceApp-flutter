import 'package:ecommerceapp/Apis/CollectionsApi.dart';
import 'package:ecommerceapp/Blocs/CollectionsBloc/CollectionProductsBloc.dart';
import 'package:ecommerceapp/Models/Collection.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CollectionProductsPage.dart';

class AllCollectionsPage extends StatefulWidget {
  @override
  _AllCollectionsPageState createState() => _AllCollectionsPageState();
}

class _AllCollectionsPageState extends State<AllCollectionsPage> {
  CollectionApi collectionApi = CollectionApi();
  CollectionProductsBloc collectionProductsBloc = CollectionProductsBloc();

  @override
  void dispose() {
    super.dispose();
    collectionProductsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Scaffold(
      body: FutureBuilder(
        future: null,
        builder: (context , snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
             return noConnectionWidget();
              break;
            case ConnectionState.waiting:
            case ConnectionState.active:
              return loadingWidget();
              break;
            case ConnectionState.done:
              if (snapshot.hasError){
                return errorWidget(snapshot.error);
              } else {
                if (!snapshot.hasData){
                  return noDataWidget();
                } else {
                  return _screen(snapshot.data, context);
                }
              }
              break;
          }
          return Container();
        },
      ),
    );
  }

  Widget _screen(List<Collection> collections, BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            _background(collections, index),
            _backgroundLayer(),
            _items(collections, index, context)
          ],
        );
      },
      itemCount: collections.length,
    );
  }

  Widget _background(List<Collection> collections, index) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(collections[index].image),
        ),
      ),
    );
  }

  Widget _backgroundLayer() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.4),
    );
  }

  Widget _items(List<Collection> collections, index, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              collections[index].name,
              style: GoogleFonts.shadowsIntoLight(
                textStyle: TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Text(
              collections[index].description,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.06,
            child: RaisedButton(
              child: Text(
                'Discover',
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                collectionProductsBloc.addCollection.add(collections[index].id);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CollectionProductsPage()));
              },
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
