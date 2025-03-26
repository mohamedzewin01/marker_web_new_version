

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomTextFormField(
        controller: TextEditingController(),
        hintText:
        AppLocalizations.of(context)?.whatAreSearch,
        // enabled: false,
        onChanged: (value) {
          // updateSearch(value);
        },
        suffix: Icon(
          Icons.search,
          color: ColorManager.placeHolderColor2,
        ),
      ),
    );
  }
}

//
// List<ProductsBestDeals>? filteredProducts;
// List<ProductsBestDeals>? bestDeals;
// String query = "";
// TextEditingController searchController = TextEditingController();
//
// @override
// void initState() {
//   super.initState();
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     setState(() {
//       bestDeals =
//       ModalRoute.of(context)?.settings.arguments
//       as List<ProductsBestDeals>?;
//       filteredProducts = bestDeals;
//     });
//   });
// }
//
// void updateSearch(String searchQuery) {
//   setState(() {
//     query = searchQuery;
//     if (searchQuery.isEmpty) {
//       filteredProducts = bestDeals;
//     } else {
//       filteredProducts =
//           bestDeals
//               ?.where(
//                 (product) =>
//             product.productName!.toLowerCase().contains(
//               searchQuery.toLowerCase(),
//             ) ||
//                 product.description!.toLowerCase().contains(
//                   searchQuery.toLowerCase(),
//                 ),
//           )
//               .toList();
//     }
//   });
// }