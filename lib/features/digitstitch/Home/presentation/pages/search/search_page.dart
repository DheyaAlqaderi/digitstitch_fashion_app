import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/search/search_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/search/search_state.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/pages/search/card_product_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  Future<void> _callApi() async {
    // Call your API here using the search query (_searchController.text)
    await context.read<SearchQueryCubit>().searchQuery(_searchController.text.trim().toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30.0),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        // Call the API only if the search query is not empty or null
                        if (_searchController.text.trim().isNotEmpty) {
                          await _callApi();
                        } else {
                          // Show a snackbar or any other feedback to indicate that search query is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a search query'),
                            ),
                          );
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  ),
                  onSubmitted: (value) async {
                    // Call the API only if the search query is not empty or null
                    if (value.trim().isNotEmpty) {
                      await _callApi();
                    } else {
                      // Show a snackbar or any other feedback to indicate that search query is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a search query'),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10.0),
                BlocBuilder<SearchQueryCubit, SearchQueryState>(
                  builder: (context, state) {
                    if (state is SearchQueryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          // Customizing the appearance of the CircularProgressIndicator
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.brown), // Change the color
                          strokeWidth: 4.0, // Adjust the thickness of the stroke
                        ),
                      );
                    } else if (state is SearchQueryLoaded) {
                      return _buildProductList(state.productModel);
                    } else if (state is SearchQueryError) {
                      return Center(
                        child: Text('Error: ${state.error}'),
                      );
                    } else {
                      return const SizedBox(); // Placeholder for other states
                    }
                  },
                ),
              ],
            ),
        ),
      ),
    );
  }


  Widget _buildProductList(ProductModel? productModel) {
    if (productModel?.products != null && productModel!.products!.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productModel.products?.length ?? 0,
        itemBuilder: (context, index) {
          final result = productModel.products?[index];
          return CardProductSearch(
            productPrice: result?.price,
            productName: result?.name,
            producImage: result?.image,
            productDescription: result?.description,
          );
        },
      );
    } else {
      return const Center(
        child: Text('No products found'),
      );
    }
  }
}
