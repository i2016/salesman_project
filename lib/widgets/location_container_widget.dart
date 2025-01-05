/*
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/widgets/MapScreen.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.315,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.085
                : MediaQuery.of(context).size.height * 0.182,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/DefaultMarkerComponent.png'),
                 Text(
                   "location_not_set".tr(),
                  style: TextStyle(
                    color: Color(0xff758195),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {

                final location = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
                if (location != null) {
                  Shared.addStoreLocationLatitude = location.latitude;
                  Shared.addStoreLocationLongtitude = location.longitude;
                  print('Selected Location: ${location.latitude}, ${location.longitude}');
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.315,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.0425
                        : MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffDCDFE3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Map.png',
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.006,
                    ),
                     Text(
                       "open_map".tr(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.315,
                height: MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.0425
                          : MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Map.png',
                      color: const Color(0xffAF2A1A),
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.006,
                    ),
                     Text(
                       "remove_location".tr(),
                      style: TextStyle(
                          color: Color(0xffAF2A1A),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Clients/presentation/widgets/MapScreen.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  void _removeLocation() {
    Shared.addStoreLocationLatitude = '';
    Shared.addStoreLocationLongtitude = '';
    print('Location removed');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: 0.5,
          child: _buildLocationBox(
            context,
            screenSize,
            isPortrait,
            iconPath: 'assets/images/DefaultMarkerComponent.png',
            text: "location_not_set".tr(),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final location = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
                if (location != null) {
                  Shared.addStoreLocationLatitude = location.latitude.toString();
                  Shared.addStoreLocationLongtitude = location.longitude.toString();
                  print('Selected Location: ${location.latitude}, ${location.longitude}');
                } else {
                  print('No location selected');
                }
              },
              child: _buildActionButton(
                context,
                screenSize,
                isPortrait,
                iconPath: 'assets/images/Map.png',
                text: "open_map".tr(),
                iconColor: null,
              ),
            ),
            InkWell(
              onTap: _removeLocation,
              child: _buildActionButton(
                context,
                screenSize,
                isPortrait,
                iconPath: 'assets/images/Map.png',
                text: "remove_location".tr(),
                iconColor: const Color(0xffAF2A1A),
                textColor: const Color(0xffAF2A1A),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationBox(
      BuildContext context,
      Size screenSize,
      bool isPortrait, {
        required String iconPath,
        required String text,
      }) {
    return Container(
      width: screenSize.width * 0.315,
      height: isPortrait ? screenSize.height * 0.085 : screenSize.height * 0.182,
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(iconPath),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff758195),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context,
      Size screenSize,
      bool isPortrait, {
        required String iconPath,
        required String text,
        Color? iconColor,
        Color? textColor,
      }) {
    return Container(
      width: screenSize.width * 0.315,
      height: isPortrait ? screenSize.height * 0.0425 : screenSize.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffDCDFE3), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            color: iconColor,
            height: screenSize.height * 0.015,
          ),
          SizedBox(width: screenSize.width * 0.006),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
