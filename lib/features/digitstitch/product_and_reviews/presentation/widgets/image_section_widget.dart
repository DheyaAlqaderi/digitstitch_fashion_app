import 'package:flutter/material.dart';


class ImageSectionWidget extends StatefulWidget {
   ImageSectionWidget({super.key, required this.images});
  List<String> images;
  @override
  State<ImageSectionWidget> createState() => _ImageSectionWidgetState();
}

class _ImageSectionWidgetState extends State<ImageSectionWidget> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  // this function is for dots animation
  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.grey,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SizedBox(
            height: 243.0,
            width: double.infinity,
            child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: widget.images.length,
                itemBuilder: (context, i){
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.images[i]),
                          fit: BoxFit.cover,
                        )
                    ),
                  );
                }
            ),
          ),

          Positioned(
            bottom: 15.0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                    (int index) => _buildDots(
                  index: index,
                ),
              ),
            ),
          )

        ]
    );
  }
}
