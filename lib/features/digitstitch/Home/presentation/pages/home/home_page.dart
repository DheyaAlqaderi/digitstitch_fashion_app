import 'package:carousel_slider/carousel_controller.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_banners/get_banners_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/banners/banners_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/helper/shareprefrence_manager.dart';
import '../../cubit/banners/banners_state.dart';
import '../../widgets/banner_section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token;
  List<String> propertyImageList = [
    'assets/images/secure_payment.jpg',
    'assets/images/secure_payment.jpg',
    'assets/images/secure_payment.jpg',
    'assets/images/secure_payment.jpg',
    'assets/images/secure_payment.jpg',
    'assets/images/secure_payment.jpg',
    'assets/images/secure_payment.jpg',

  ];
  List<String> propertyTitleList = [
    "البرج المثالي",
    "two",
    "three",
    'four',
    'five',
    'six',
    'seven',
  ];
  List<dynamic> propertyPrice = [
    1000.0,
    500,
    6000,
    100000,
    54120,
    5410,
    7500
  ];
  List<bool> isFavoriteList = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
  ];

  @override
  void initState() {
    super.initState();
    // Retrieve token data
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final bannerCubit = context.read<BannerCubit>();
      bannerCubit.getBanners();
    });
    retrieveToken();
  }

  Future<void> retrieveToken() async {
    try {
      // Retrieve token from shared preferences
      token = await SharedPrefManager.getData('token');
      // If token is null, handle it accordingly
      if (token == null) {
        // Show a message or navigate to login page
      }
    } catch (e) {
      // Handle error while retrieving token
      if (kDebugMode) {
        print('Error retrieving token: $e');
      }
      // Show a message or navigate to login page
    }
    setState(() {});
  }

  Future<void> _handleRefresh() async {
    // Simulate network fetch or database query
    await Future.delayed(Duration(seconds: 2));
    // Update the list of items and refresh the UI
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final bannerCubit = context.read<BannerCubit>();
        bannerCubit.getBanners();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () {
            return context.read<BannerCubit>().getBanners();
          },
          child: Column(
            children: [
              SizedBox(height: 30,),
              // appbar section
              appbarSection(),

              // banner section
              const SizedBox(height: 10.0,),
              BlocConsumer<BannerCubit, BannersState>(
                listener: (context, state) {
                  if (state is ErrorBannersState) {
                    // Handle error state
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: ${state.error}'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingBannersState) {
                    // Show loading indicator while fetching banners
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SuccessBannersState) {
                    // Show banner section with retrieved data
                    return BannerSectionWidget(
                      images: state.bannerResponseModel.map((banner) => banner.image_fullpath).toList(),
                      title: state.bannerResponseModel.map((banner) => banner.title).toList(),
                      description: state.bannerResponseModel.map((banner) => banner.banner_type).toList(),
                    );
                  } else {
                    // Show empty state or handle other cases
                    return const SizedBox();
                  }
                },
              ),

              // flash sale
              // 3. Section Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildSectionHeader('الفئات'),
              ),

              // categories section

              // latest products

              // for you
            ],
          ),
        ),

    );
  }




  Padding appbarSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("تسوق",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
          Container(
            height: 36.0,
            width: 248.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFF8F8F8),
            ),
            child: InkWell(
              onTap: () {
                context.read<BannerCubit>().getBanners();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.search)
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '...بحث',
                        style: TextStyle(
                            fontSize: 16.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildSectionHeader(String text) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 38,
          width: 90,
          child: TextButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text(
              'عرض الكل',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                height: 0.09,
                letterSpacing: 0.30,
              ),
            ),
          ),
        ),
        const Spacer(flex: 3),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF242B5C),
            fontSize: 18,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 0.54,
          ),
        ),
      ],
    );
  }

}
