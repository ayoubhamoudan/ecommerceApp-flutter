import 'package:ecommerceapp/Components/ComponentsSizes/ListItemSizes.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Pages/ProductDetailsPage.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget ListItemComponent(List<Product> products, BuildContext context, index) {
  ScreenConfig screenConfig = ScreenConfig(context);
  ListItemSizes listItemSizes = ListItemSizes(screenConfig);
  return GestureDetector(
    onTap: () {
      _showProductDetails(products[index], context);
    },
    child: Padding(
      padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.007),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.3623,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(products[index].featuredImage),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              products[index].brand,
              style: GoogleFonts.bebasNeue(
                textStyle: TextStyle(
                  fontSize: listItemSizes.BrandFontSize,
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.37,
              child: Text(
                products[index].title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: listItemSizes.TitleFontSize,
                  ),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              r"$" + products[index].price.toString(),
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: listItemSizes.PriceFontSize)),
            ),
          ],
        ),
      ),
    ),
  );
}


_showProductDetails(Product product, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return ProductDetailsPage(product);
      },
    ),
  );
}
