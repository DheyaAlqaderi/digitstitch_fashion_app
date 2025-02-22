import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BannerSectionWidget extends StatefulWidget {
  BannerSectionWidget({super.key, required this.images, required this.title, required this.description});
  List<String> images;
  List<String> title;
  List<String> description;
  @override
  State<BannerSectionWidget> createState() => _BannerSectionWidgetState();
}

class _BannerSectionWidgetState extends State<BannerSectionWidget> {

  // for banner
  // for promotion items
  int activeIndex = 0;
  final controller = CarouselController();
  Widget buildIndicator() => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: const ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.brown),
    activeIndex: activeIndex,
    count: widget.images.length,
  );

  void animateToSlide(int index) => controller.animateToPage(index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider.builder(
              carouselController: controller,
              itemCount: widget.images.length,
              itemBuilder: (context, index, realIndex) {
                return promotionWidget(widget.images[index].toString(), widget.title[index], widget.description[index]);
              },
              options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index)
              )
          ),
          const SizedBox(height: 5),
          buildIndicator()
        ],
      ),
    );
  }
}



  promotionWidget(String image, String title, String description) {
    return Container(
      width: 310.0,
      height: 180,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [

          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 29,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.54,
                  ),
                ),
                const SizedBox(height: 5,),
                 Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }