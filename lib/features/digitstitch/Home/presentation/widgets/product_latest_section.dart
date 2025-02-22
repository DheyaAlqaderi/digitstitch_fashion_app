import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/models/product/latest_product_model.dart';
import 'latest_product_widget.dart';

class LatestProductSection extends StatelessWidget {
  const LatestProductSection({super.key, required this.productModel});

  final LatestProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Add functionality for the arrow icon tap
                    },
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.brown,
                      ),
                      child: Transform.rotate(
                        angle: pi,
                        child: const Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "عرض الكل",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              const Text(
                'احدث المنتجات',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  productModel.products?.length ?? 0,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LatestProductWidget(
                      image: productModel.products?[index].image ?? '',
                      name: productModel.products?[index].name ?? '',
                      price: productModel.products?[index].price ?? 0.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
        ],
      ),
    );
  }
}


