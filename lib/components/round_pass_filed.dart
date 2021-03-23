import 'package:cstore/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function validator;
  final bool boolean;
  final String hintText;

  const RoundedPasswordField(
      {Key key, this.onChanged, this.validator, this.boolean, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        readOnly: boolean ?? false,
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kNeturalBigColor,
        decoration: InputDecoration(
          hintText: hintText,
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
