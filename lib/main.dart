
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/SplashScreen/presentation/pages/splash_screen.dart';
import 'dart:io';
import 'Base/common/shared_preference_manger.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

/*
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (message != null) {
    final routeMessage = message.data['Type'];
      switch (routeMessage) {
        case "Jobs":
          break;
      }
    }
  }

*/

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalizeAndTranslate.init(
    defaultType: LocalizationDefaultType.device,
    supportedLanguageCodes: <String>['ar', 'en'],
    assetLoader: AssetLoaderRootBundleJson(
      'assets/i18n/',
    ),

  );

  //await Firebase.initializeApp();


/*
  /// maintain the push message if the application is closed
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
*/



  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}
var navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static var app_langauge;

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType();

    app_langauge = newLocale.languageCode;
    state?.setState(() => state.local = newLocale);
  }

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale? local;
  Key? key = UniqueKey();
  void restartApp() {
    setState(() {
      get_Static_data();
      key = UniqueKey();
    });
  }

  void get_Static_data() async {
    await sharedPreferenceManager.readString(CachingKey.APP_LANGUAGE).then((value) {
      if (value == '') {
        MyApp.app_langauge = LocalizeAndTranslate.getLanguageCode();
      } else {
        MyApp.app_langauge = value;
      }
    });
    /*   String? device_token = await FirebaseMessaging.instance.getToken();
    sharedPreferenceManager.writeData(CachingKey.DEVICE_TOKEN, device_token);*/
  }

  @override
  void initState() {
    super.initState();
    get_Static_data();
    // _fcmConfigure(context);

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: local,
        supportedLocales: LocalizeAndTranslate.getLocals(),

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
    //    key: navigatorKey,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
            fontFamily:'GE Dinar One',

        ),

        home: LocalizedApp(
          child: SplashScreen(),
        ));
  }

/*
  Future<void> _fcmConfigure(BuildContext context) async {
    LocalNotificationService.initialize(context);
    final _firebaseMessaging = FirebaseMessaging.instance;


    String? device_token = await FirebaseMessaging.instance.getToken();
    sharedPreferenceManager.writeData(CachingKey.DEVICE_TOKEN, device_token);
    print("device token : ${device_token}");

    ///required by IOS permissions
    _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    // //get the current device token
    // _getCustomerNotification();

    ///gives you the message on which use taps
    ///and it opened from the terminated state
    _firebaseMessaging.getInitialMessage().then((message) async {
      // get the remote message when your app opened from push notification while in background state
      RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

// check if it is exists
      if (initialMessage != null) {
        // check the data property within RemoteMessage and do navigate based on it


        if (initialMessage != null) {
          final routeMessage = initialMessage.data['Type'];
            switch (routeMessage) {
              case "Jobs":
                break;


          }
        }
      }
    });

    ///app open on ForeGround. notification will not be visibile but you will receive the data
    FirebaseMessaging.onMessage.listen((message) {


      if (message.notification != null) {
        LocalNotificationService.display(message);
      }

      if (message != null) {
        final routeMessage = message.data['Type'];
          switch (routeMessage) {
            case "Jobs":
              Navigator.push(
                  navigatorKey.currentState!.context,
                  MaterialPageRoute(
                      builder: (context) => DashboardScreen()));
              break;

          }
        }

    });

    ///app in background and not terminated when you click on the notification this should be triggered
    FirebaseMessaging.onMessageOpenedApp.listen((message) {

      if (message != null) {
        final routeMessage = message.data['Type'];
          switch (routeMessage) {
            case "Jobs":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DashboardScreen()));
              break;

        }
      }
    });

    FirebaseMessaging.onBackgroundMessage((message)async{
      await Firebase.initializeApp();

      if (message != null) {
        final routeMessage = message.data['Type'];
          switch (routeMessage) {
            case "Jobs":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>DashboardScreen(
                    //     image_path: baseUrl + previous_job.attachments!.firstWhere((element) => element.status ==1).filePath!
                  )



              ));
              break;

        }
      }
    });

  }
*/

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}