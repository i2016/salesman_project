import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Visits/presentation/widgets/photo_gallery_widget.dart';
import 'package:image/image.dart' as img;
class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {

File? _selectImage;
String? _base64Image;

  _takePicture() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,  // You can reduce the maxWidth to control image size
    );
    if (pickedImage == null) {
      return;
    }

    // Read the image as bytes
    final bytes = await File(pickedImage.path).readAsBytes();

    // Decode the image for further processing
    img.Image? image = img.decodeImage(bytes);
    if (image == null) {
      print('Error: Unable to decode image');
      return;
    }

    // Resize or compress the image (reduce quality)
    img.Image resizedImage = img.copyResize(image, width: 600); // Adjust width as needed

    // Encode the resized image to JPG with lower quality (0-100)
    List<int> compressedImageBytes = img.encodeJpg(resizedImage, quality: 85); // Adjust quality as needed (higher is better)

    // Convert the compressed image to Base64
    String base64Image = base64Encode(compressedImageBytes);
    print("Compressed Base64 Image: $base64Image");

    // Update the state and shared list
    setState(() {
      _selectImage = File(pickedImage.path);
      Shared.images_list.add(base64Image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        color: Color.fromARGB(255, 228, 224, 224),
        dashPattern: const [12, 14],
        strokeWidth: 2,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Shared.images_list.length > 0
                  ? PhotoGalleryWidget()
                  : Container(),
        InkWell(
          onTap: _takePicture,
          child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "add_image".tr(),
                      style: TextStyle(
                        color: Color(0xff1D7AFC),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.005,
                    ),
                    Image.asset(
                      'assets/images/AddCCCircle.png',
                      height: MediaQuery.of(context).size.height * 0.017,
                    ),
                  ],
                ),
              )),
            ],
          )


        ),
      );
  }
}

