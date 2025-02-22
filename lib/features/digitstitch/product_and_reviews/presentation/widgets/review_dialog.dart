import 'package:flutter/material.dart';

class AddReviewDialog extends StatefulWidget {
  const AddReviewDialog({super.key});

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add a Review"),
      content: TextField(
        controller: _reviewController,
        decoration: const InputDecoration(hintText: "Write your review here..."),
        maxLines: 3, // Set the maximum number of lines for the review
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            String review = _reviewController.text;
            // Implement your logic to submit the review
            // For example, you can call an API to post the review data
            // Once the review is submitted, you can close the dialog
            Navigator.of(context).pop();
          },

          child: const Text("Submit"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}


