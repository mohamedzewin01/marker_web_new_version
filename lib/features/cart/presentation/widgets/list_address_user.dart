import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/addresses_user_dto.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: ListView.separated(
        separatorBuilder:(context, index) => Container(height: 1,color: Colors.grey.shade300,),

        itemCount: widget.addresses?.length??0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            child: ListTile(
              onTap: () {
                print('widget.addresses?[index].id');
                setState(() {
                  selectedIndex == index ? selectedIndex = null : selectedIndex = index;
                  context.read<CartCubit>().setIdAddress(widget.addresses?[index].id);

                  print(widget.addresses?[index].id);
                });


              },
              leading: Icon(
                Icons.location_on,
                color:
                selectedIndex == index
                    ? ColorManager.orange
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
                            ? ColorManager.orange
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
                            ? ColorManager.orange
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
                      ? ColorManager.orange
                      : ColorManager.black,
                  fontSize: 12,
                ),
              ),
              trailing: Radio<int>(
                value: index,
                activeColor:
                selectedIndex == index
                    ? ColorManager.orange
                    : ColorManager.black,
                groupValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                    context.read<CartCubit>().setIdAddress(widget.addresses?[index].id);


                    print(widget.addresses?[index].id);

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


