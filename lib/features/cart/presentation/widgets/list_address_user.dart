import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/addresses_user_dto.dart';
import 'package:flutter/material.dart';

class ListAddressUser extends StatefulWidget {
  const ListAddressUser({super.key, this.addresses});

  final List<AddressesData>? addresses;

  @override
  State<ListAddressUser> createState() => _ListAddressUserState();
}

class _ListAddressUserState extends State<ListAddressUser> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: widget.addresses?.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            color:
            selectedIndex == index
                ? ColorManager.orange.withAlpha(200)
                : ColorManager.white,
            elevation: 4,
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex == index ? selectedIndex = null : selectedIndex = index;
                });


              },
              leading: Icon(
                Icons.location_on,
                color:
                selectedIndex == index
                    ? ColorManager.white
                    : ColorManager.green,
              ),

              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.addresses?[index].title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getSemiBoldStyle(
                        color:
                        selectedIndex == index
                            ? ColorManager.white
                            : ColorManager.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.addresses?[index].city ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getSemiBoldStyle(
                        color:
                        selectedIndex == index
                            ? ColorManager.white
                            : ColorManager.black,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              subtitle: Text(
                widget.addresses?[index].details ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getSemiBoldStyle(
                  color:
                  selectedIndex == index
                      ? ColorManager.white
                      : ColorManager.black,
                  fontSize: 12,
                ),
              ),
              trailing: Radio<int>(
                value: index,
                activeColor:
                selectedIndex == index
                    ? ColorManager.white
                    : ColorManager.black,
                groupValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


