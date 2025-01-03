import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class TransectionRowInIndebtednessContainer extends StatelessWidget {
  const TransectionRowInIndebtednessContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.color});

  final String image;
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Row(
            children: [
              const Text(
                '123414',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.012,
              ),
              Image.asset(
                image,
                color: color,
                height: MediaQuery.of(context).size.height * 0.0144,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.006,
              ),
              Text(
                name,
                style: TextStyle(
                    color: color, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
         Expanded(
          flex: 3,
          child: Opacity(
            opacity: 0.6,
            child: Text(
              '50,000 ${"sar".tr()}',
              style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const Expanded(
          flex: 3,
          child: Opacity(
            opacity: 0.6,
            child: Text(
              ' 21 / 8 / 2024',
              style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
