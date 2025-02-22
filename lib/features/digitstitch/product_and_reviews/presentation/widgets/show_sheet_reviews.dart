import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/widgets/review_card.dart';
import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/widgets/review_dialog.dart';
import 'package:flutter/material.dart';

class ShowSheetReviews extends StatefulWidget {
  const ShowSheetReviews({super.key});

  @override
  State<ShowSheetReviews> createState() => _ShowSheetReviewsState();
}

class _ShowSheetReviewsState extends State<ShowSheetReviews> {
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Row(
                children: [
                  Icon(Icons.arrow_back_sharp, size: 30.0,),
                  SizedBox(width: 10,),
                  Text("التعليقات", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),

              const SizedBox(height: 40.0,),
              Container(
                width: 127.0,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.brown
                ),
                child: InkWell(
                  onTap: (){
                    showAddReviewDialog(context);
                  },
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.add,),
                        Text("أضافة تعليق"),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return const ReviewCard(
                    image: "assets/images/img.png",
                    reviewText: "helooooooooooooooooooooooooooooooooooo Worllllllllllllllld",
                    reviewRating: 4.5,
                    personName: "Dheya Alqadery",
                  );
                },
              )
            ],
          ),
        ),
      )
    );
  }
}

void showAddReviewDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AddReviewDialog();
    },
  );
}
