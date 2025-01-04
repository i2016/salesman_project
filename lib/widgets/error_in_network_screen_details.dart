import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/index.dart';
import 'package:water/widgets/error_interface_widget.dart';

import 'navigate_basic_container.dart';
import 'package:flutter/material.dart';

class ErrorInNetworkScreenDetails extends StatelessWidget {
  const ErrorInNetworkScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.55,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.24,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.041
                            : MediaQuery.of(context).size.height * 0.063,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const ImageIcon(AssetImage(
                                    'assets/images/Icon-Wrappppper.png')),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                               Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "hide_list".tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Opacity(
                        opacity: 0.55, child: NavigateBasicContainer()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
                Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ErrorInterface(errorImage:  'assets/images/errorInNetwork.png',
                     errorTitle: "network_error".tr(),
                      errorSubTitle: "network_error_message".tr(),
                      imageSize: 0.55,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
