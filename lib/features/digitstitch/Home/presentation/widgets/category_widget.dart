import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, this.productImage, this.categoryName, this.productCount, this.productImage2});
  final String? productImage;
  final String? productImage2;
  final int? productCount;
  final String? categoryName;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset from the top-left corner
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 75.5,
                  width: 75.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.productImage!),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  height: 75.5,
                  width: 75.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.productImage2!),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 75.5,
                  width: 75.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.productImage!),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  height: 75.5,
                  width: 75.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.productImage2!),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.categoryName!),
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 25,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFE9FF),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text(
                      widget.productCount!.toString(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

