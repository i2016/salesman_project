import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ErrorInterface extends StatelessWidget {
  const ErrorInterface(
      {super.key,
      required this.errorImage,
      required this.errorTitle,
      required this.errorSubTitle, required this.imageSize});

  final String errorImage;
  final String errorTitle;
  final String errorSubTitle;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          errorImage,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * imageSize,
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 0
              : MediaQuery.of(context).size.height * 0.042,
        ),
        Text(
          errorTitle,
          style: const TextStyle(
              color: Color(0xffAF2A1A),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.006,
        ),
        Text(
          errorSubTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.015
              : MediaQuery.of(context).size.height * 0.022,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.32,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.04
                : MediaQuery.of(context).size.height * 0.068,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Refresh.png',
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.022
                        : MediaQuery.of(context).size.width * 0.016,
                    color: Colors.black),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.006,
                ),
                 Opacity(
                  opacity: 0.8,
                  child: Text(
                    "retry".tr(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
