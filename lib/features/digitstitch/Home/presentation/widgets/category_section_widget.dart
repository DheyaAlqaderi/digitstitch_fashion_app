import 'dart:math';

import 'package:digitstitch_app/features/digitstitch/Home/data/models/category/category_model.dart';
import 'package:flutter/material.dart';

import 'category_widget.dart';

class CategorySectionWidget extends StatefulWidget {
  final List<CategoryModel> categoryModel;

  const CategorySectionWidget({super.key, required this.categoryModel});

  @override
  _CategorySectionWidgetState createState() => _CategorySectionWidgetState();
}

class _CategorySectionWidgetState extends State<CategorySectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        child: const Icon(Icons.arrow_forward, color: Colors.white,),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Text(
                    "عرض الكل",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              const Text(
                'الفئات',
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
        ),

        // List of categories
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20, // Add horizontal spacing between items
                mainAxisSpacing: 20, // Add vertical spacing between items
                mainAxisExtent: 198.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.categoryModel.take(6).length,
              itemBuilder: (context, index) {
                return CategoryWidget(
                  productImage: widget.categoryModel[index].image_fullpath,
                  productImage2: widget.categoryModel[index].banner_image_fullpath,
                  categoryName: widget.categoryModel[index].name,
                  productCount: widget.categoryModel[index].products_count,
                );
              },
            ),
        ),
      ],
    );
  }
}
