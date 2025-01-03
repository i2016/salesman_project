import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Returns/presentation/bloc/create_returnsbloc.dart';

class PillPaymentReviewReturnedProducts extends StatelessWidget {
  const PillPaymentReviewReturnedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        Text(
                          '',
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: Shared.returns_products_list.isEmpty ? null :(){
                    createReturnsBloc.add(CreateReturnsEvent());

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.038
                        : MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Color(0xff1D7AFC),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/CheckCircle.png',
                            color: Colors.white),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                         Opacity(
                          opacity: 0.7,
                          child: Text(
                        "create_invoice".tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


