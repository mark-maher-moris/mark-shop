import 'package:flutter/material.dart';

class CustemTextFeild extends StatelessWidget {
  final bool isPassword;
  final String hint;
  String outVal = '';
  final onClick;

  String? errorMes(String etr) {
    switch (hint) {
      case 'Enter your email':
        return 'Enter your email';

      case 'Enter your password':
        return 'Enter your password';
      default:
        {
          'Somthing went wrong ';
        }
    }
  }

  CustemTextFeild(
      {required this.isPassword, required this.hint, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: TextFormField(
          onSaved: onClick,
          validator: (value) {
            if (value!.isEmpty) {
              return errorMes(hint);
            }
          },
          obscureText: isPassword,
          decoration: InputDecoration(
              icon: Icon(isPassword ? Icons.lock : Icons.email),
              hintText: hint,
              // To delete borders
              enabledBorder: OutlineInputBorder(
                  borderSide: Divider.createBorderSide(context),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              // fillColor: Colors.red,
              filled: true,
              fillColor: Colors.amber,
              contentPadding: const EdgeInsets.all(8),
              errorStyle: TextStyle(color: Colors.yellow))),
    );
  }
}
