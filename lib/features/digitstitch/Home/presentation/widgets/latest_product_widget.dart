import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class LatestProductWidget extends StatelessWidget {
  const LatestProductWidget({Key? key, this.image, this.name, this.price}) : super(key: key);

  final  image;
  final String? name;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 104.0,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 3), // Offset from the top-left corner
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 103,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider("$ProductImageBaseUrl${image[0]}"),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),

            SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
                child: Text(
                  name.toString(),
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                  maxLines: 1, // Set the maximum number of lines
                  overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                ),
              ),
            ),
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "\$ ${price.toString()}",
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}

