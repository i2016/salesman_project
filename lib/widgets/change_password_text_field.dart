
import 'package:flutter/material.dart';

class ChangePasswordTextField extends StatefulWidget {
  const ChangePasswordTextField({
    super.key,
    required this.nameTextField,
    required this.hintTextField,
    required this.controller,
  });

  final String nameTextField;
  final String hintTextField;
  final TextEditingController controller;

  @override
  State<ChangePasswordTextField> createState() =>
      _ChangePasswordTextFieldState();
}

class _ChangePasswordTextFieldState extends State<ChangePasswordTextField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.nameTextField,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.039
                : MediaQuery.of(context).size.height * 0.065,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(255, 215, 212, 212),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: widget.controller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintTextField,
                    hintStyle: const TextStyle(
                      color: Color(0xff758195),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
