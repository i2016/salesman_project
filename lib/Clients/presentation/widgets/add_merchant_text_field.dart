
/*import 'package:flutter/material.dart';

class AddMerchantTextField extends StatelessWidget {
  const AddMerchantTextField({
    super.key,
    required this.hintTextField,
    required this.nameTextField,
    required this.onChange,
    required this.input,
    this.isRequired = false,
  });

  final String hintTextField;
  final String nameTextField;
  final TextInputType input;
  final bool isRequired;
  final String? Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: nameTextField,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                isRequired ?   const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ) : const TextSpan(),
              ],
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
                color: const Color.fromARGB(255, 215, 212, 212),
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
              onChanged: (value) {
                onChange?.call(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}*/


import 'package:flutter/material.dart';

class AddMerchantTextField extends StatefulWidget {
  const AddMerchantTextField({
    super.key,
    required this.hintTextField,
    required this.nameTextField,
    required this.onChange,
    required this.input,
    this.isRequired = false,
    this.initialValue = '',
  });

  final String hintTextField;
  final String nameTextField;
  final TextInputType input;
  final bool isRequired;
  final String? Function(String?)? onChange;
  final String initialValue; // New field to pass the initial value

  @override
  _AddMerchantTextFieldState createState() => _AddMerchantTextFieldState();
}

class _AddMerchantTextFieldState extends State<AddMerchantTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue); // Set the initial value
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.nameTextField,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                widget.isRequired
                    ? const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                )
                    : const TextSpan(),
              ],
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
                color: const Color.fromARGB(255, 215, 212, 212),
              ),
            ),
            child: TextField(
              controller: _controller, // Assign the controller to the TextField
              keyboardType: widget.input,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.014,
                ),
                border: InputBorder.none,
                hintText: widget.hintTextField,
                hintStyle: const TextStyle(
                  color: Color(0xff758195),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onChanged: (value) {
                widget.onChange?.call(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
