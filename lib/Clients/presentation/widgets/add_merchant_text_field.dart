import 'package:flutter/material.dart';

class AddMerchantTextField extends StatelessWidget {
  const AddMerchantTextField(
      {super.key,
      required this.hintTextField,
      required this.nameTextField,
        required  this.onChange,
      required this.input});

  final String hintTextField;
  final String nameTextField;
  final TextInputType input;
  final String? Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameTextField,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.003,
            ),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.01,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.044
                  : MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color.fromARGB(255, 215, 212, 212),
                ),
              ),
                  child: TextField(
                      keyboardType: input,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.014,
                        ),
                        border: InputBorder.none,
                        hintText: hintTextField,
                        hintStyle: const TextStyle(
                          color: Color(0xff758195),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    onChanged: (value){
                      onChange!.call(value);
                    },
                    ),
            ),
          ],
        ),
    );
  }
}
