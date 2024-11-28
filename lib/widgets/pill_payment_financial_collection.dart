import 'package:flutter/material.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Visits/presentation/bloc/create_collection/create_collection_bloc.dart';

class PillPaymentFinancialCollection extends StatelessWidget {
  const PillPaymentFinancialCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        Image.asset('assets/images/Banknote2.png'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.007,
                        ),
                        const Text(
                          'متبقى 25,000 ر.س',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: (){
                    createCollectionBloc.add(CreateCollectionEvent());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.04
                        : MediaQuery.of(context).size.height * 0.068,
                    decoration: BoxDecoration(
                        color: const Color(0xff1D7AFC),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/CheckCircle.png',
                            color: Color(0xffF9F9F9)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        const Opacity(
                          opacity: 0.7,
                          child: Text(
                            'اصدار الفاتورة',
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

