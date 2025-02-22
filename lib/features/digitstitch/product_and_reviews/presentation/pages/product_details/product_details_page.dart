import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/widgets/choice_options_widget.dart';
import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/widgets/image_section_widget.dart';
import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/widgets/review_card.dart';
import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/widgets/show_sheet_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/product_details/product_details_cubit.dart';
import '../../cubit/product_details/product_details_state.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String mergedOptions = "";
  late String selectedChips;
  List<String> images =[
    "assets/images/img.png",
    "assets/images/img.png",
    "assets/images/img.png",
    "assets/images/img.png",
    "assets/images/img.png",
  ];
  List<Map<String, dynamic>> variations = [
    {"type": "Red-xl", "price": 5000, "stock": 3},
    {"type": "Red-xll", "price": 4000, "stock": 4},
    {"type": "Red-ml", "price": 14356, "stock": 0},
    {"type": "Red-mxl", "price": 0, "stock": 0},
    {"type": "Black-xl", "price": 6000, "stock": 2}, // Added Black variations
    {"type": "Black-xll", "price": 4500, "stock": 1},
    {"type": "Black-ml", "price": 12000, "stock": 0},
    {"type": "Black-mxl", "price": 0, "stock": 0},
    {"type": "Blue-xl", "price": 5500, "stock": 2}, // Added Blue variations
    {"type": "Blue-xll", "price": 4700, "stock": 1},
    {"type": "Blue-ml", "price": 13500, "stock": 0},
    {"type": "Blue-mxl", "price": 0, "stock": 0},
  ];
  final List<Map<String, dynamic>> choiceOptions = [
    {
      "name": "choice_3",
      "title": "الون",
      "options": [
        "Red",
        "Black",
        "Blue",
      ]
    },
    {
      "name": "choice_2",
      "title": "الحجم",
      "options": [
        "xl",
        "xll",
        "ml",
        "mxl",
      ]
    }
  ];

  late final List<List<bool>> isSelected = List.generate(choiceOptions.length, (index) {
    final options = choiceOptions[index]['options'] as List<String>? ?? [];
    return List<bool>.filled(options.length, false);
  });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productDetailsCubit = context.read<ProductDetailsCubit>();

      var data = productDetailsCubit.getProductDetails(widget.productId);


      // // Automatically select the first chip in each category
      for (int i = 0; i < choiceOptions.length; i++) {
        final options = choiceOptions[i]['options'] as List<String>;
        onChipSelected(i, options.length - 1, options.last);
      }
      // Print the merged string
      // if (kDebugMode) {
      //   print(mergedOptions);
      // }
      selectVariationType(mergedOptions, variations);
    });

  }

  // this function when i click the chip do something
  void onChipSelected(int choiceIndex, int optionIndex, String selectedOption) {
    setState(() {
      isSelected[choiceIndex] = List.generate(isSelected[choiceIndex].length, (index) => index == optionIndex);
      // Get the current selected options
      List<String?> selectedOptions = choiceOptions.map((choiceOption) {
        List<String> options = List<String>.from(choiceOption['options'] ?? []);
        return options.indexWhere((option) => isSelected[choiceOptions.indexOf(choiceOption)][options.indexOf(option)]) != -1
            ? options[options.indexWhere((option) => isSelected[choiceOptions.indexOf(choiceOption)][options.indexOf(option)])]
            : null;
      }).toList();

      // Remove null values (unselected options)
      selectedOptions.removeWhere((option) => option == null);

      // Merge the selected options into a single string
      mergedOptions = selectedOptions.join('-');
      /// selectVariationType(mergedOptions, variations);

    });
  }

  // select variation type and price
  String selectVariationType(String targetType, List<Map<String, dynamic>> variations) {
    for (var variation in variations) {
      if (variation["type"] == targetType) {
        // Select the type
        // Handle selection logic here
        print('Selected variation: ${variation['price']}');
        return "\$${variation["price"].toString()}";
      }
    }
    // Return an empty string if no matching variation is found
    return "";
  }

  // this function for separate the the string like this : "Red-xl" => "Red" "xl"
  Map<String, String> separateValues(String input) {
    List<String> parts = input.split('-');
    if (parts.length == 2) {
      return {
        'color': parts[0],
        'size': parts[1],
      };
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: (){

              },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.brown,
                )
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  if (state is LoadingProductDetailsState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorProductDetailsState) {
                    // final variations = state.productDetailsModel.product!.variations!.cast<Map<String, dynamic>>().toList();
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // image section
                        ImageSectionWidget(images: images),

                        // name and price and counter section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              /// title section
                               Text(
                                variations[1]["type"],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),

                              /// price section
                              const SizedBox(height: 5,),
                              Text(
                                selectVariationType(mergedOptions, variations),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.brown),
                              ),

                              /// options choice
                              const SizedBox(height: 10,),
                              ChoiceOptionsWidget(
                                // choiceOptions: state.productDetailsModel.product!.choiceOptions!.cast<Map<String, dynamic>>().toList(),
                                choiceOptions: choiceOptions,
                                isSelected: isSelected,
                                onChipSelected: onChipSelected,
                              ),

                              /// description section
                              const SizedBox(height: 10,),
                              const Text(
                                "الوصف",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                "الحياة مدرسة، ومنها نتعلم دروساً عديدة، فنحن نمر بتجارب كثيرة، وحصاد هذه التجارب هي من تصقل شخصيتنا، وتبنيها لنصبح أفضل كلما تقدمنا بالعمر، والحكمة ما هي إلا نتيجة التجربة لذلك يوجد العديد من الفلاسفة العظماء من كتب العديد من الحكم التي تشمل جميع جوانب الحياة، وفي هذا المقال بعض هذه الحكم المتنوعة."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),

                              /// description section
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      showBottomSheet( context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("عرض الكل", style: TextStyle(fontSize: 13, color: Colors.brown),),
                                    ),
                                  ),
                                  const Text(
                                    "التعليقات والتقييم",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              ReviewCard(
                                image: images[0],
                                personName: "Dheya Yahya",
                                reviewRating: 4.0,
                                reviewText: "coooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
                                    "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooool",
                              )

                            ],
                          ),
                        )

                      ],
                    );
                  } else if (state is SuccessProductDetailsState) {
                    return Center(child: Text(state.productDetailsModel.product!.variations.toString()));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
      ),
    );
  }



  // handle when clicking the show more reviews
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const ShowSheetReviews();
      },
    );
  }
}
