import 'package:cstore/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function validator;
  const RoundedPasswordField({Key key, this.onChanged, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kNeturalBigColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kNeturalBigColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
