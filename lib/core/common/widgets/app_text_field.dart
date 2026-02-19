import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isSearch;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.isPassword,
    this.validator,
    this.isSearch = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obsureText = true;

  @override
  void initState() {
    _obsureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.controller.text.isEmpty
            ? widget.hintText
            : widget.controller.text,
        hintStyle: TextStyle(color: Colors.grey),
        // then to set the on and off password icon, if it is password
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obsureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obsureText = !_obsureText;
                  });
                },
              )
            : null,
        prefix: widget.isSearch == true
            ? Icon(Icons.search, color: AppPallette.appBlack)
            : null,
      ),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      // to obscure text if it is a password field
      obscureText: widget.isPassword ? _obsureText : false,
      // i think i should pass the other validators from the parent widget
      // bcus the other text fields may have different validation needs
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${widget.hintText}';
        }
        if (widget.validator != null) {
          return widget.validator!(value);
        }
        return null;
      },
    );
  }
}
