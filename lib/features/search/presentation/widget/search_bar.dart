import 'package:fada_alhalij_web/core/api/api_constants.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../blocs/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.viewModel});

  final SearchCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => showFilterBottomSheet(context, viewModel),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorManager.primaryColor,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(Assets.filter),
                      ),
                    ),
                  ),

                ),
                SizedBox(width: 12),
                Expanded(
                  child: TypeAheadField(
                    controller: viewModel.searchController,
                    suggestionsCallback: (search) {
                      return viewModel.productsSuggested
                          .take(3)
                          .where(
                            (product) =>
                                product.productName!.toLowerCase().contains(
                                  viewModel.searchController.text.toLowerCase(),
                                ) ||
                                product.description!.toLowerCase().contains(
                                  search.toLowerCase(),
                                ) ||
                                product.categoryName!.toLowerCase().contains(
                                  search.toLowerCase(),
                                ),
                          )
                          .toList();
                    },
                    builder: (context, controller, focusNode) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        onChanged: (value) {
                          viewModel.searchProducts(search: value);
                          print(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'بحث ...',
                        ),
                      );
                    },
                    itemBuilder: (context, product) {
                      String price =
                          product.productPriceAfterDiscount == 0
                              ? '${product.productPrice}'
                              : product.productPriceAfterDiscount.toString();
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            '${ApiConstants.baseUrlImage}${product.imageCover}',
                          ),
                          radius: 20,
                        ),
                        title: Text(product.productName ?? ''),
                        subtitle: Text('السعر: $price'),
                      );
                    },
                    onSelected: (product) {
                      viewModel.searchController.text =
                          product.productName ?? '';
                      viewModel.searchProducts(
                        search: product.productName ?? '',
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void showFilterBottomSheet(BuildContext context, SearchCubit viewModel) {
  final minPriceController = TextEditingController(text: 0.toString());
  final maxPriceController = TextEditingController(text: 1000.toString());
  String? sortBy = viewModel.sortBy;
  String? order = viewModel.order;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'فلترة البحث',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: minPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'السعر الأدنى',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null) {
                        viewModel.minPrice == parsed;
                      }
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: maxPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'السعر الأعلى',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null) {
                        viewModel.maxPrice == parsed;
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: sortBy,
              decoration: InputDecoration(
                labelText: 'ترتيب حسب',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'product_price', child: Text('السعر')),
                DropdownMenuItem(value: 'product_name', child: Text('الاسم')),
              ],
              onChanged: (val) {
                if (val != null) {
                  sortBy = val;
                  viewModel.sortBy == val;
                }
              },
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: order,
              decoration: InputDecoration(
                labelText: 'نوع الترتيب',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'asc', child: Text('تصاعدي')),
                DropdownMenuItem(value: 'desc', child: Text('تنازلي')),
              ],
              onChanged: (val) {
                if (val != null) {
                  order = val;
                  viewModel.order = val;
                }
              },
            ),
            SizedBox(height: 25),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primaryColor,
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                await viewModel.searchProducts();
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset(Assets.filter,),
              label: Text(
                'تطبيق',
                style: getSemiBoldStyle(
                  color: ColorManager.white,
                  fontSize: 14,
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
