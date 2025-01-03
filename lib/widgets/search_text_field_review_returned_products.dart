import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SearchTextFieldReviewReturnedProducts extends StatelessWidget{
  const SearchTextFieldReviewReturnedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
            icon: const Icon(Icons.arrow_back)
            ),
         Text(
          "Returned_Products_Review".tr(),
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500
          ),
        ),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.019,
          ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait ?
          MediaQuery.of(context).size.height * 0.033
          : MediaQuery.of(context).size.height * 0.052,
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
                  
                hintText:"search_product".tr(),
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 165, 171, 182),
                )
              ),
            ),
          )
        ),
      ],
    );
  }
}