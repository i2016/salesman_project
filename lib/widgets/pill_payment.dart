import 'package:flutter/material.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Visits/presentation/bloc/create_order/create_order_bloc.dart';

class PillPayment extends StatelessWidget {
  const PillPayment({super.key, required this.textButton, this.dialogName = 'pill'});

  final String textButton;
  final String dialogName;

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
                         Text(
                      dialogName == "transferRequest" ? 'متبقى  ${Shared.remainingLimit - Shared.calculateTotalForAllProducts()} ر.س'
                          :    'متبقى 25,000 ر.س',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: Shared.order_products_list.isEmpty ? null :
                      () {
                     if(dialogName == 'pill'){
                    createOrderBloc.add(CreateOrderEvent());
                  }else if(dialogName == 'edit'){
                    Dialogs.showDialogSaveEdits(context);
                  }else if(dialogName == 'transferRequest'){
                       print("Shared.remainingLimit : ${Shared.remainingLimit}");
                       print("Shared.calculateTotalForAllProducts() : ${Shared.calculateTotalForAllProducts()}");
                      if( Shared.remainingLimit >= Shared.calculateTotalForAllProducts() ){
                        inventoryTransferRequestBloc.add(InventoryTransferRequestEvent());
                      }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                            content: Text(
                            "الرصيد غير كافي",
                            style: TextStyle(color: Colors.white),
                            ),
                            duration: Duration(seconds: 2),
                            ) );
                      }

                  }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.038
                        : MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Shared.order_products_list.isEmpty ? kGreyColor :const Color(0xff1D7AFC),
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
                            textButton,
                            style: const TextStyle(
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