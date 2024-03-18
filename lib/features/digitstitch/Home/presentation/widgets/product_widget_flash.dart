import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitstitch_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductWidgetFlash extends StatefulWidget {
  const ProductWidgetFlash({super.key, this.productImage, this.productDiscount});
  final productImage;
  final productDiscount;

  @override
  State<ProductWidgetFlash> createState() => _ProductWidgetFlashState();
}

class _ProductWidgetFlashState extends State<ProductWidgetFlash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset from the top-left corner
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 103.0,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider("$ProductImageBaseUrl${widget.productImage[0].toString()}",),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 22.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          colors: [
                            Colors.pinkAccent.withOpacity(0.9),
                            Colors.pinkAccent.withOpacity(0.9),
                          ],
                      ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      "-${widget.productDiscount.toString()}%",
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),

                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
