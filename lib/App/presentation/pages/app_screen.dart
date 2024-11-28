

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/widgets/navigate_basic_container_widget.dart';
import 'package:water/App/presentation/widgets/navigate_in_visit_details_container_widget.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Base/connectivity/network_indicator.dart';
import 'package:water/Base/safe_area/page_container.dart';

 //GlobalKey<ScaffoldState>? scaffoldKey ;
class AppScreen extends StatefulWidget {
  final Widget? child;
  final Widget? drawer;
  final List<Widget>? screenButtons;
  final String menuType;
  final bool visitDetails;


  AppScreen({this.child, this.drawer,this.screenButtons,this.menuType = "mainMenu" ,
    this.visitDetails = false});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  @override
  void initState() {
    //scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async => false,
      child: NetworkIndicator(
        child: PageContainer(

          child: Directionality(
            textDirection:  TextDirection.ltr,
            child: Scaffold(
         //    key: scaffoldKey,
              endDrawer: widget.drawer,
              body: Container(
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                                ? 8
                                : 11,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: widget.child!,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 11, vertical: 8),
                                    child: Row(
                                      textDirection:
                                      LocalizeAndTranslate.getLanguageCode() ==
                                          'en'
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      children: [
                                        InkWell(
                                          onTap: (){},
                                          child: const ImageIcon(
                                            AssetImage(
                                                'assets/images/Icon-Wrappppper.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                        ),
                                        const Opacity(
                                          opacity: 0.8,
                                          child: Text('اخفاء القائمة'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.025,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width * 0.5,
                                  child: NavigateBasicContainer(
                                    menuType: widget.menuType,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.025,
                                ),
                                widget.visitDetails == false ?
                                Container(
                                  decoration: BoxDecoration(
                                      color:  widget.screenButtons!.length ==0 ? kTransparentColor : kWhiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: widget.screenButtons!.length ==0 ? kTransparentColor : kInactiveColor)
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.screenButtons!.length,
                                    itemBuilder: (context, index) {
                                      return  widget.screenButtons![index];
                                    },
                                  ),
                                )
                                    : NavigateInVisitDetailsContainer(
                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



