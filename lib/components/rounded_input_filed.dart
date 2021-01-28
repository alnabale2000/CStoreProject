import 'package:cstore/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function validator;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorColor: kNeturalBigColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kNeturalBigColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
