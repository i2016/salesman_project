import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Visits/presentation/bloc/categories_bloc.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/available_items_screen_details_land_scape.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/available_items_screen_details_protrait.dart';


class AvailableItemsScreenDetails extends StatelessWidget {
  AvailableItemsScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
            child:    BlocBuilder<CategoriesBloc, AppState>(
              bloc: categoriesBloc,
              builder: (context, state) {
                if (state is Loading) {
                  return const LoadingPlaceHolder(
                    shimmerType: ShimmerType.list,
                    cellShimmerHeight: 50,
                    shimmerCount: 10,
                  );
                }
                else if (state is GetCategoriesDone) {
                  if(state.categories != null && state.categories!.isNotEmpty) {
                    return OrientationBuilder(
                      builder: (context, orientation) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 8, left: 8, top: 11),
                          child: orientation == Orientation.portrait
                              ? AvailableItemsScreenDetailsProtrait(
                            categories: state.categories,
                          )
                              : AvailableItemsScreenDetailsLandScape(
                            categories: state.categories,
                          ),
                        );
                      },

                    );
                }
                  else{
                    return Center(
                      child: Text("no_items_available".tr()),
                    );
                  }

                } else if (state is GetCategoriesErrorLoading) {
                  return Center(
                    child: Text("${state.message}"),
                  );
                } else {
                  return Container();
                }

              },
            )


        ),
      ),
    );

  }
}



