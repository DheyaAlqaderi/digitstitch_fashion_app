import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../../core/constants/constants.dart';

class CardProductSearch extends StatefulWidget {
  const CardProductSearch({super.key, this.producImage, this.productName, this.productDescription, this.productPrice, this.productRating});
  final producImage;
  final productName;
  final productDescription;
  final productPrice;
  final productRating;

  @override
  State<CardProductSearch> createState() => _CardProductSearchState();
}

class _CardProductSearchState extends State<CardProductSearch> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Set the elevation for the card shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            10), // Set the radius for rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(8), // Adjust padding for better spacing
        child: Row(
          children: [
            Container(
              height: 64.5,
              width: 55.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider("$ProductImageBaseUrl${widget.producImage[0]!}"),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            const SizedBox(width: 10), // Add spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.productName!}", // Placeholder text, replace with actual data
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // Ensure text doesn't wrap
                    maxLines: 1, // Ensure text stays within a single line
                  ),
                  const SizedBox(height: 4),
                  Html(
                    data: widget.productDescription!,
                    style: {
                      'body': Style(
                        color: Colors.grey,
                        fontSize: FontSize(10),
                      ),
                    },
                  ),
                  const SizedBox(height: 4), // Add vertical spacing between elements
                  Text(
                    "\$${widget.productPrice!}", // Placeholder text, replace with actual data
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }


}
