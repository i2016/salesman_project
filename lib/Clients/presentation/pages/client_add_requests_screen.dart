import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/data/models/client_add_requests_model.dart';
import 'package:water/Clients/presentation/bloc/clients_bloc.dart';
import 'package:water/Clients/presentation/pages/clients_screen.dart';
import 'package:water/Clients/presentation/widgets/client_add_requests_header.dart';
import 'package:intl/intl.dart' as intl;
class ClientAddRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: _Page(),
        screenButtons:[

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

class _PageState extends State<_Page>{
  @override
  void initState() {
    super.initState();
clientsBloc.add(GetClientAddRequestsEvent());
  }
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
                  IconButton(
                      onPressed: () {
                        customAnimatedPushNavigation(context, ClientsScreen());
                      },
                      icon: const Icon(Icons.arrow_back)),
                   Text(
                    "merchant_details".tr(),
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              ClientAddRequestsHeader(),
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
                    else if (state is GetClientAddRequestsDone) {
                      ClientAddRequestsModel clientAddRequestsModel =  state.model as ClientAddRequestsModel;
                      if(clientAddRequestsModel.result != null && clientAddRequestsModel.result?.clientStatus != null
                          && clientAddRequestsModel.result!.clientStatus!.isNotEmpty) {
                        return  ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: clientAddRequestsModel.result!.clientStatus!.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).orientation == Orientation.portrait ?
                              MediaQuery.of(context).size.height * 0.050
                                  : MediaQuery.of(context).size.height * 0.052,
                              decoration: const BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                              )),
                              child: Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        intl.DateFormat("dd/MM/yy").format(
                                          DateTime.parse(clientAddRequestsModel.result!.clientStatus![index].date!),
                                        ) ?? '',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        clientAddRequestsModel.result!.clientStatus![index].customerName ?? '',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        clientAddRequestsModel.result!.clientStatus![index].status ?? '',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                      ),
                                    ),

                                  ],
                                ),
                              )    ),
                            );
                          },
                        ) ;
                      }
                      else{
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: Shared.width * 0.3),
                          child: Center(
                            child: Text("no_clients".tr()),
                          ),
                        );
                      }

                    }
                    else if (state is GetClientAddRequestsErrorLoading) {
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
          ),
        ),

    );
  }

}
