import 'package:flutter/material.dart';
import 'package:water/Base/common/theme.dart';

class TraderDealContainerItem extends StatelessWidget {
  const TraderDealContainerItem(
      {super.key, required this.name, required this.image, this.onClickStatus});

  final String name;
  final String image;
  final bool? onClickStatus;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: onClickStatus! ? kBlueColor : Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          children: [
            Image.asset(
              image,
              color: onClickStatus! ? kWhiteColor : kBlackColor,
              scale: 1.5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Flexible(
                child:   Text(
                  name,
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                      color: onClickStatus! ? kWhiteColor : kBlackColor),
                  maxLines: 2,
                )  ),
          ],
        ),
      ),
    );
  }
}