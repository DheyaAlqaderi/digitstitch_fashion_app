import 'package:carousel_slider/carousel_controller.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_banners/get_banners_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/banners/banners_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/category/category_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/category/category_state.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/flash_sale/flash_sale_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/latestProducts/flash_sale_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/latestProducts/flash_sale_state.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/widgets/category_section_widget.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/widgets/flash_sale_widget.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/widgets/product_latest_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/shareprefrence_manager.dart';
import '../../cubit/banners/banners_state.dart';
import '../../cubit/flash_sale/flash_sale_state.dart';
import '../../cubit/search/search_cubit.dart';
import '../../widgets/banner_section_widget.dart';
import '../search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final bannerCubit = context.read<BannerCubit>();
      final flashSalesCubit = context.read<FlashSaleCubit>();
      final categoryCubit = context.read<CategoryCubit>();
      final latestProduct = context.read<LatestProductCubit>();
      final searchQueryCubit = context.read<SearchQueryCubit>();
      Future.wait([
        bannerCubit.getBanners(),
        flashSalesCubit.fetchFlashSale(),
        categoryCubit.getCategory(),
        latestProduct.fetchLatestProduct(6),
        searchQueryCubit.searchQuery("")
      ]);
    });
    retrieveToken();
  }

  Future<void> retrieveToken() async {
    try {
      token = await SharedPrefManager.getData('token');
      if (token == null) {
        // Handle null token
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving token: $e');
      }
      // Handle error while retrieving token
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final bannerCubit = context.read<BannerCubit>();
          final flashSalesCubit = context.read<FlashSaleCubit>();
          final categoryCubit = context.read<CategoryCubit>();
          final latestProduct = context.read<LatestProductCubit>();
          await Future.wait([
            bannerCubit.getBanners(),
            flashSalesCubit.fetchFlashSale(),
            categoryCubit.getCategory(),
            latestProduct.fetchLatestProduct(6),
          ]);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              appbarSection(),
              const SizedBox(height: 15.0),
              BlocConsumer<BannerCubit, BannersState>(
                listener: (context, state) {
                  if (state is ErrorBannersState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: ${state.error}'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingBannersState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SuccessBannersState) {
                    return BannerSectionWidget(
                      images: state.bannerResponseModel.map((banner) => banner.image_fullpath).toList(),
                      title: state.bannerResponseModel.map((banner) => banner.title).toList(),
                      description: state.bannerResponseModel.map((banner) => banner.banner_type).toList(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 18),
              BlocBuilder<FlashSaleCubit, FlashSaleState>(
                builder: (context, state) {
                  if (state is LoadingFlashState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessFlashState) {
                    return FlashStateWidget(duration: state.duration, flashSaleModel: state.flashSaleModel);
                  } else if (state is ErrorFlashState) {
                    return Center(child: Text(state.error));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 18),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is LoadingCategoryState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessCategoryState) {
                    return CategorySectionWidget(categoryModel: state.categoryModel.toList());
                  } else if (state is ErrorCategoryState) {
                    return Center(child: Text(state.error));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 18),
              BlocBuilder<LatestProductCubit, LatestProductState>(
                builder: (context, state) {
                  if (state is LoadingLatestProductState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessLatestProductState) {
                    return LatestProductSection(productModel: state.productModel);
                  } else if (state is ErrorLatestProductState) {
                    return Center(child: Text(state.error));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 18),

            ],
          ),
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
              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.grey[100],
            ),
            child: InkWell(
              onTap: () {
                // Navigate to HomePage when login is successful
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
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


}
