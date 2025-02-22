
import 'package:flutter/material.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, this.reviewText, this.reviewRating, this.image, this.personName});
  final reviewText;
  final reviewRating;
  final image;
  final personName;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 67.0,
                  height: 67.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15,),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          widget.personName,
                        style: const TextStyle(
                          color: Colors.black
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.star, color: Colors.amberAccent,),
                          Text(widget.reviewRating.toString(),
                            style: const TextStyle(
                                color: Colors.black
                            ),
                          ),
                          const SizedBox(width: 10,)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10
                        ,bottom: 5.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.reviewText,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          // Add your text style properties here
                        ),
                      ),
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
