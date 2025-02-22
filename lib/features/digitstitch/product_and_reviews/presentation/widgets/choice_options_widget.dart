import 'package:flutter/material.dart';

class ChoiceOptionsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> choiceOptions;
  final List<List<bool>> isSelected;
  final void Function(int, int, String) onChipSelected;

   const ChoiceOptionsWidget({
    super.key,
    required this.choiceOptions,
    required this.isSelected,
    required this.onChipSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(choiceOptions.length, (index) {
        final Map<String, dynamic> option = choiceOptions[index];
        final List<String> options = List<String>.from(option['options'] ?? []);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              option['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true, // Scroll from end to start
              child: Row(
                children: List.generate(options.length, (optionIndex) {
                  final choice = options[optionIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Call the callback function to update isSelected
                        onChipSelected(index, optionIndex, choice);
                      },
                      child: ChoiceChip(
                        label: Text(
                          choice,
                          style: TextStyle(
                            color: isSelected[index][optionIndex] ? Colors.white : Colors.black,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        selected: isSelected[index][optionIndex],
                        selectedColor: Colors.brown,
                        showCheckmark: false, // Prevent check icon from being displayed
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      }),
    );
  }
}


