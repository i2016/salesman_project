import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/widgets/client_menu_container_item.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Clients/presentation/pages/add_merchant_information_screen.dart';
import 'package:water/Clients/presentation/pages/clients_screen.dart';
import 'package:water/Dashboard/presentation/pages/dashboard_screen.dart';
import 'package:water/Inventory/presentation/pages/inventory_screen.dart';
import 'package:water/Profile/presentation/pages/profile_screen.dart';
import 'package:water/Visits/presentation/pages/Today/previous_invoices_screen.dart';
import 'package:water/Visits/presentation/pages/Today/visits_today_screen.dart';
import 'package:water/Visits/presentation/pages/Today/available_items_screen.dart';
import 'package:water/index.dart';
import 'package:water/returns/presentation/pages/return_orders_screen.dart';
import 'package:water/App/presentation/widgets/trader_deal_container_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigateBasicContainer extends StatefulWidget {
  NavigateBasicContainer({super.key, this.menuType = "mainMenu"});
  final String menuType;

  @override
  State<NavigateBasicContainer> createState() => _NavigateBasicContainerState();
}

class _NavigateBasicContainerState extends State<NavigateBasicContainer> {
  int mainIndex = 0;
  int subIndex = 0;
  int clientIndex = 0;

  List<MenuElement> MainMenu = [];
  List<MenuElement> subMenu = [];
  List<ClientMenuElement> clientMenu = [];

  List<Widget> _mainMenuBuildScreens = [];
  List<Widget> _subMenuBuildScreens = [];
  List<Widget> _clientMenuBuildScreens = [];

  @override
  void initState() {
    super.initState();
    _loadSavedIndex();

    switch (widget.menuType) {
      case 'mainMenu':
        MainMenu = [
          MenuElement(
              title: 'الرئيسية',
              image: 'assets/images/VectorHome.png',
              screenIndex: 0),
          MenuElement(
              title: 'الزيارات',
              image: 'assets/images/VectorVisits.png',
              screenIndex: 1),
          MenuElement(
              title: Shared.userType == 'B2C' ? 'مرتجعات' : 'اوامر الشغل',
              image: Shared.userType == 'B2C'
                  ? 'assets/images/overView.png'
                  : 'assets/images/IconWrapperrrrr.png',
              screenIndex: 2),
          MenuElement(
              title: 'العملاء',
              image: 'assets/images/VectorClints.png',
              screenIndex: 3),
          MenuElement(
              title: 'المخزن',
              image: 'assets/images/VectorBuild.png',
              screenIndex: 4),
          MenuElement(
              title: 'الحساب',
              image: 'assets/images/Vvvectorss.png',
              screenIndex: 5),
        ];
        _mainMenuBuildScreens = [
          DashboardScreen(),
          VisitsTodayScreen(),
          Shared.userType == 'B2C' ? ReturnOrdersScreen() : WorkOrdersScreen(),
          ClientsScreen(),
          InventoryScreen(),
          ProfileScreen()
        ];
        break;
      case 'subMenu':
        subMenu = [
          MenuElement(
              title: 'بيع',
              image: 'assets/images/IconWrapperrrrr.png',
              screenIndex: 0),
          MenuElement(
              title: 'مرتجع جيد',
              image: 'assets/images/RestartCircle.png',
              screenIndex: 1),
          MenuElement(
              title: 'مرتجع سيء',
              image: 'assets/images/badReturned.png',
              screenIndex: 2),
          MenuElement(
              title: 'تحصيل',
              image: 'assets/images/MoneyBag.png',
              screenIndex: 3),
          MenuElement(
              title: 'صور',
              image: 'assets/images/camera.png',
              screenIndex: 4),
        ];
        _subMenuBuildScreens = [
          AvailableItemsScreen(),
          PreviousInvoicesScreen(),
          PreviousInvoicesScreen(),
          FinancialCollectionScreen(),
          AttachPhotosScreen(),
        ];
        break;
      case 'clientMenu':
        clientMenu = [
          ClientMenuElement(
            title: "التاجر",
            image: 'assets/images/User.png',
            screenIndex: 0,
            primaryImage: 'assets/images/IconIndicator.png',
            secondary: 'assets/images/IconMerchant.png',
          ),
          ClientMenuElement(
            title: "المتجر",
            image: 'assets/images/Shop.png',
            screenIndex: 1,
            primaryImage: 'assets/images/IconIndicator.png',
            secondary: 'assets/images/IconMerchant.png',
          ),
          ClientMenuElement(
            title: "العنوان",
            image: 'assets/images/markk.png',
            screenIndex: 2,
            primaryImage: 'assets/images/IconIndicator.png',
            secondary: 'assets/images/IconMerchant.png',
          ),
        ];
        _clientMenuBuildScreens = [
          AddMerchantInformationScreen(),
          AddStoreInformationScreen(),
          AddClientLocationScreen(),
        ];
        break;
    }
  }

  void _loadSavedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      mainIndex = prefs.getInt('mainIndex') ?? 0;
      subIndex = prefs.getInt('subIndex') ?? 0;
      clientIndex = prefs.getInt('clientIndex') ?? 0;
    });
  }

  void _saveIndex(int newIndex) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('mainIndex', mainIndex);
    prefs.setInt('subIndex', subIndex);
    prefs.setInt('clientIndex', clientIndex);

  }
  Future<String> _getUserName() async {
    return await sharedPreferenceManager.readString(CachingKey.USER_NAME) ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: menuTypeDesign(widget.menuType),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuTypeDesign(String menuType) {
    switch (widget.menuType) {
      case 'mainMenu':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          FutureBuilder<String>(
            future: _getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Container();
              }
              final userName = snapshot.data ?? '';
              return Text(
                ' أهلا $userName ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.014,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: MainMenu.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.011),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      mainIndex = i;
                      _saveIndex(mainIndex);
                    });
                    navigateToScreen(context, mainIndex, _mainMenuBuildScreens);
                  },
                  child: TraderDealContainerItem(
                    name: MainMenu[i].title,
                    image: MainMenu[i].image,
                    onClickStatus: MainMenu[i].screenIndex == mainIndex,
                  ),
                ),
              );
            },
          )
        ]);
      case 'subMenu':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                children: [
                  const Text(
                    'بدأ المعاملة مع ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    ' اسم المتجر',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subMenu.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.011),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        subIndex = i;
                        _saveIndex(subIndex);
                      });
                      print("subIndex : ${subIndex}");
                      switch(subIndex){
                        case 1: 
                          sharedPreferenceManager.writeData(CachingKey.RETURNS_TYPE, "good");
                          break;
                        case 2 :
                          sharedPreferenceManager.writeData(CachingKey.RETURNS_TYPE, "bad");
                          break;
                      }
                      navigateToScreen(context, subIndex, _subMenuBuildScreens);
                    },
                    child: TraderDealContainerItem(
                      name: subMenu[i].title,
                      image: subMenu[i].image,
                      onClickStatus: subMenu[i].screenIndex == subIndex,
                    ),
                  ),
                );
              },
            )
          ],
        );
      case 'clientMenu':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'اضافة عميل جديد ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF25292E)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: const Text(
                      'ادخل معلومات العميل',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF25292E)),
                    ),
                  )
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: clientMenu.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.011),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        clientIndex = i;
                        _saveIndex(clientIndex);
                      });
                      navigateToScreen(context, clientIndex, _clientMenuBuildScreens);
                    },
                    child: ClientMenuContainerItem(
                      name: clientMenu[i].title,
                      image: clientMenu[i].image,
                      onClickStatus: clientMenu[i].screenIndex == clientIndex,
                      primaryImage: clientMenu[i].primaryImage,
                      secondaryImage: clientMenu[i].secondary,
                    ),
                  ),
                );
              },
            )
          ],
        );
      default:
        return Container();
    }
  }
}

class MenuElement {
  final String title;
  final String image;
  final int screenIndex;

  MenuElement({required this.title, required this.image, required this.screenIndex});
}

class ClientMenuElement {
  final String title;
  final String image;
  final int screenIndex;
  final String primaryImage;
  final String secondary;

  ClientMenuElement(
      {required this.title,
        required this.image,
        required this.screenIndex,
        required this.primaryImage,
        required this.secondary});
}

void navigateToScreen(BuildContext context, int index, List<Widget> screens) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      screens[index],
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}
