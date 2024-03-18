import 'package:digitstitch_app/features/digitstitch/Home/presentation/widgets/product_widget_flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/product/product_model.dart';

class FlashStateWidget extends StatefulWidget {
  const FlashStateWidget({super.key, required this.flashSaleModel,required this.duration});
  final flashSaleModel;
  final duration;

  @override
  State<FlashStateWidget> createState() => _FlashStateWidgetState();
}

class _FlashStateWidgetState extends State<FlashStateWidget> {
  @override
  Widget build(BuildContext context) {
    return buildSuccessStateUI(widget.duration, widget.flashSaleModel?.products);



  }

  Widget buildSuccessStateUI( Duration duration, List<Product>? products) {
    return Column(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/clock_icon.svg", width: 17.0, height: 19.0,),
                    const SizedBox(width: 10,),
                    Container(
                      height: 21.0,
                      width: 21.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC7C7C7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          formatDurationInHours(duration),
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 21.0,
                      width: 21.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC7C7C7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                            formatDurationInMinutes(duration),
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 21.0,
                      width: 21.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC7C7C7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                            formatDurationInSeconds(duration),
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'مبيعات الفلاش',
                  style:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.54,
                  ),
                ),
              ],
            ),
          ),
          if (products != null && products.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20, // Add horizontal spacing between items
                  mainAxisSpacing: 20, // Add vertical spacing between items
                  mainAxisExtent: 103.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.take(6).length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return ProductWidgetFlash(
                    productImage: product.image,
                    productDiscount: product.discount,
                  );
                },
              ),
            ),

          ],
        ],

    );
  }

  String formatDurationInHours(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return twoDigits(duration.inHours.remainder(24));
  }

  String formatDurationInMinutes(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return twoDigits(duration.inMinutes.remainder(60));
  }

  String formatDurationInSeconds(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return twoDigits(duration.inSeconds.remainder(60));
  }

}
