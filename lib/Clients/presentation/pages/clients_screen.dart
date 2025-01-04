import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/clients_model.dart';
import 'package:water/Clients/presentation/bloc/clients_bloc.dart';
import 'package:water/Clients/presentation/pages/add_merchant_information_screen.dart';
import 'package:water/Clients/presentation/pages/client_add_requests_screen.dart';
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
          text: "Add Client".tr(),
          onClick: () {
            customAnimatedPushNavigation(context, AddMerchantInformationScreen());
          },
        ),
        AppButtonWidget(
          asset: 'assets/images/addWithoutBorder.png',
          text: "Add Requests".tr(),
          onClick: () {
            customAnimatedPushNavigation(context, ClientAddRequestsScreen());

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
  TextEditingController _searchController = TextEditingController();
  List<Client> _filteredClients = [];
  List<Client> _allClients = [];

  @override
  void initState() {
    super.initState();
    clientsBloc.add(GetAllClientsEvent());
  }

  void _filterClients(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredClients = _allClients;
      } else {
        _filteredClients = _allClients
            .where((client) =>
        client.customerName?.toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList();
        print("_filteredClients : ${_filteredClients}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Registered Clients".tr(),
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.033,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.5),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterClients,
                    cursorColor: Color.fromARGB(255, 66, 64, 64),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        prefixIcon: Image.asset(
                          'assets/images/search.png',
                          color: Colors.black,
                        ),
                        hintText: "search_for_client".tr(),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 146, 155, 171),
                        )),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                  } else if (state is GetAllClientsDone) {
    /*  ClientsModel clientsModel = state.model as ClientsModel;
                    _allClients = clientsModel.result?.clients ?? [];
                    _filteredClients = _filteredClients.isNotEmpty
                        ? _filteredClients
                        : [];*/
                    print("state.clients  : ${state.clients }");
                    _allClients = state.clients ?? [];
                    final displayClients = _searchController.text.isNotEmpty
                        ? _filteredClients
                        : _allClients ;
                    if (displayClients.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: displayClients.length,
                        itemBuilder: (context, index) {
                          return RegisteredCustomersScreenContainerItem(
                            storeName: displayClients[index].customerName ?? '',
                            sales: displayClients[index]
                                .totalAmount
                                .toString()
                                .replaceAll('.', ',') ??
                                '30,000',
                            distance: '${"Far_away".tr()}  23 ${"km".tr()}',
                            money: displayClients[index]
                                .totalAmountDue
                                .toString()
                                .replaceAll('.', ',') ??
                                '15,000',
                            type: "client",
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.3),
                          child: Text("No clients currently".tr()),
                        ),
                      );
                    }
                  } else if (state is GetAllClientsErrorLoading) {
                    return Center(
                      child: Text("${state.message}"),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

