
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:async';

import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';

class PhotoGalleryWidget extends StatefulWidget {
  @override
  _PhotoGalleryWidgetState createState() => new _PhotoGalleryWidgetState();
}

class _PhotoGalleryWidgetState extends State<PhotoGalleryWidget> {
  List<Asset> resultList = [];
  String _error = 'No Error Dectected';

  Widget buildGridView() {

    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 7/3,
      children: List.generate(Shared.images_list.length, (index) {
       return Card(
          clipBehavior: Clip.antiAlias,

          child:  Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  child:    Image.memory( Shared.base64ToImage(Shared.images_list[index])
                    ,fit: BoxFit.cover,
                width: double.infinity,
                   // height: MediaQuery.of(context).size.width * 0.1,
                    height: double.infinity,
                )),
              Positioned(
                right: 5,
                top: 5,
                child: InkWell(
                  child: Icon(
                    Icons.remove_circle,
                    size: 20,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      Shared.images_list.removeAt(index);


                    });
                  },
                ),
              ),
            ],
            ),
            ) ;
      }),
    );
  }

  Future<void> loadAssets() async {
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: Shared.assets_list,
        iosOptions: IOSOptions(
          albumButtonColor: kGreyColor,
         cancelButton: UIBarButtonItem(title: "cancel",tintColor: kRedColor),
         doneButton: UIBarButtonItem(title: "done",tintColor: kGreenColor),
         settings: CupertinoSettings()
        ),
        androidOptions: AndroidOptions(
          actionBarColor: kGreenColor,
          actionBarTitle: "Yanabie",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: kGreyColor,
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      Shared.assets_list = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection:LocalizeAndTranslate.getLanguageCode()== 'ar' ?
      TextDirection.rtl : TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(right:15,top: 5),
        width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.15,
        child: buildGridView()
      ),

    );

  }
}