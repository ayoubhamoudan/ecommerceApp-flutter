import 'package:ecommerceapp/Apis/CartApi.dart';
import 'package:ecommerceapp/Blocs/CartBloc/GetCartBloc.dart';
import 'package:ecommerceapp/Models/Cart.dart';
import 'package:ecommerceapp/Pages/PagesSizes/CartPageSizes.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GetCartBloc getCartBloc = GetCartBloc();

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    CartPageSizes cartPageSizes = CartPageSizes(screenConfig);
    return _CartPage(context);
  }

  Widget _CartPage(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    CartPageSizes cartPageSizes = CartPageSizes(screenConfig);
    return StreamBuilder(
        stream: getCartBloc.cartStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return noConnectionWidget();
              break;
            case ConnectionState.waiting:
              return Container(
                color: Colors.white,
                child: loadingWidget(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              print(snapshot.data.totalPrice);
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Text('CArt Page'),
                ),
                bottomNavigationBar: _bottomItems(cartPageSizes.ButtonHeight,
                    cartPageSizes.ButtonTextFontSize),
              );
              break;
          }
          return Container();
        });
  }

  Widget _bottomItems(double ButtonHeight, ButtonTextFonSize) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: ButtonHeight,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(88),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 9,
                      offset: Offset(0, 6),
                    )
                  ]),
              child: Center(
                child: Text(
                  'Check Out',
                  style: GoogleFonts.poppins(
                    fontSize: ButtonTextFonSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text('5555')
      ],
    );
  }
}
