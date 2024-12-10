import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/clients_model.dart';
import 'package:water/Clients/presentation/bloc/clients_bloc.dart';
import 'package:water/Clients/presentation/pages/add_merchant_information_screen.dart';
import 'package:water/Clients/presentation/widgets/registered_customers_screen_container_item.dart';

import '../../../App/presentation/pages/app_screen.dart';
import '../../../App/presentation/widgets/app_home_button_widget.dart';

class ClientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: _Page(),
      screenButtons:[
        AppButtonWidget(
          asset: 'assets/images/add.png',
          text: 'اضافة عميل',
          onClick: () {
            customAnimatedPushNavigation(context, AddMerchantInformationScreen());
          },
        ),
        AppButtonWidget(
          asset: 'assets/images/addWithoutBorder.png',
          text: 'طلبات اضافة',
          onClick: () {

          },
          color: kWhiteColor,
        ),
      ]
    );
  }
}

class _Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<_Page> {

  @override
  void initState() {
    super.initState();
clientsBloc.add(GetAllClientsEvent());
  }
  @override
  Widget build(BuildContext context) {
    return   Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text(
      'العملاء المسجلين',
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
    ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
        Expanded(
          child: BlocBuilder<ClientsBloc, AppState>(
            bloc: clientsBloc,
            builder: (context, state) {
              if (state is Loading) {
                return const LoadingPlaceHolder(
                  shimmerType: ShimmerType.list,
                  cellShimmerHeight: 50,
                  shimmerCount: 10,
                );
              }
              else if (state is GetAllClientsDone) {
                ClientsModel clientsModel =  state.model as ClientsModel;
                if(clientsModel.result != null && clientsModel.result?.clients != null
                    && clientsModel.result!.clients!.isNotEmpty) {
                  return  ListView.builder(
                   // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: clientsModel.result!.clients!.length,
                    itemBuilder: (context, index) {
                      return  RegisteredCustomersScreenContainerItem(
                        storeName: clientsModel.result!.clients![index].customerName ??'',
                        sales: clientsModel.result!.clients![index].totalAmount.toString().replaceAll('.', ',') ??'30,000 ',
                        distance: 'يبعد 23 ك.م',
                        money: clientsModel.result!.clients![index].totalAmountDue.toString().replaceAll('.', ',') ??'15,000 ',
                        type: "client",
                      );
                    },
                  ) ;
                }
                else{
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: Shared.width * 0.3),
                    child: Center(
                      child: Text("لا يوجد عملاء حاليا"),
                    ),
                  );
                }
          
              }
              else if (state is GetAllClientsErrorLoading) {
                return Center(
                  child: Text("${state.message}"),
                );
              } else {
                return Container();
              }
          
            },
          ),
        )

          ],
        )
      ));

  }
}
