import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SearchTextFieldAvailableItemsScreen extends StatelessWidget{
  const SearchTextFieldAvailableItemsScreen({super.key, required this.hintText});

final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "available_items".tr(),
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.019,
          ),
          MediaQuery.of(context).orientation == Orientation.portrait ?
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.033,
          decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5),
            child: TextField(
              cursorColor: Color.fromARGB(255, 66, 64, 64),
              decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                prefixIcon: Image.asset(
                  'assets/images/search.png',
                  color: Colors.black,
                  ),
                  
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 146, 155, 171),
                )
              ),
            ),
          )
        )
        : Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.053,
          decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5),
            child: TextField(
              cursorColor: Color.fromARGB(255, 66, 64, 64),
              decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                prefixIcon: Image.asset(
                  'assets/images/search.png',
                  color: Colors.black,
                  ),
                  
                hintText: "search_for_item_or_product".tr(),
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 146, 155, 171),
                )
              ),
            ),
          )
        ),
      ],
    );
  }
}