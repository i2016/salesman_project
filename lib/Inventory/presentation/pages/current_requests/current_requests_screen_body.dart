import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/bloc/invoice_history_bloc.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Inventory/presentation/pages/inventory_screen.dart';
import 'package:water/widgets/button.dart';
import 'package:water/widgets/current_request_grid_view_item.dart';
import 'package:water/widgets/navigate_basic_container.dart';
import 'package:water/widgets/visit_type_containers.dart';

class CurrentRequestsScreenBody extends StatelessWidget {
  CurrentRequestsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                      InkWell(
                        onTap: () {
                          customAnimatedPushNavigation(context, InventoryScreen());
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.012,
                      ),
                      const Text(
                        'طلبات التحويل',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.014,
                    ),
             /*       Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const VisitTypeContainers(
                        textFirstContainer: 'الحالة',
                        textSecondContainer: 'من',
                        textThirdContainer: 'الى',
                      ),
                    ),*/

                    BlocBuilder<InventoryTransferRequestBloc, AppState>(
                      bloc: inventoryTransferRequestBloc,
                      builder: (context, state) {
                        if (state is Loading) {
                          return const LoadingPlaceHolder(
                            shimmerType: ShimmerType.list,
                            cellShimmerHeight: 50,
                            shimmerCount: 10,
                          );
                        }
                        else if (state is GetTransferRequestsHistoryDone) {
                          if(state.transferRequests != null ){

                            return  Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.transferRequests!.length,
                                    itemBuilder: (context, index) {
                                      return  CurrentRequestGridViewItem(
                                        transferId: state.transferRequests![index].transferId!,
                                        saleName: 'اجمالي  ${state.transferRequests![index].itemsPrice!.toStringAsFixed(2).toString()}  ر.س',
                                        pill: 'طلب رقم ${state.transferRequests![index].transferName}',
                                        date: '${state.transferRequests![index].transferDate}}طلب بتاريخ  ',
                                        icon: 'assets/images/period.png',
                                        color: Color(0xff0056C9),
                                        textIcon: '${state.transferRequests![index].transferStatus}',
                                        productNumber: '${state.transferRequests![index].items.toString().split('.')[0]} منتج',
                                      );

                                    })
                            );
                          }
                          else{
                            return Center(
                              child: Text("لا توجد فواتير حاليا"),
                            );
                          }

                        } else if (state is GetTransferRequestsHistoryErrorLoading) {
                          return Center(
                            child: Text("${state.message}"),
                          );
                        } else {
                          return Container();
                        }

                      },
                    )
                    ,
                  ],
                ),
              ),
    );
  }
}
