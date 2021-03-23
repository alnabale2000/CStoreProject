import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class AdPageTextFiled extends StatelessWidget {
  final int minLines;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final Function validator;
  final String text;
  final IconData icon;
  final bool isMultiLine;
  final bool isNumber;

  AdPageTextFiled(
      {this.minLines,
      this.maxLines,
      this.onChanged,
      this.validator,
      this.text,
      this.icon,
      this.isMultiLine = false,
      this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        color: Colors.grey[200],
        child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          keyboardType: !isMultiLine
              ? isNumber
                  ? TextInputType.number
                  : TextInputType.text
              : TextInputType.multiline,
          minLines: minLines,
          maxLines: maxLines ?? null,
          cursorColor: kNeturalBigColor,
          decoration: InputDecoration(
            fillColor: kNeturalBigColor,
            suffixIcon: Icon(icon),
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ),
    );
  }
}

class AdPageDropDown extends StatefulWidget {
  String dropDownValue;
  List<String> listContent;
  final Function validator;
  Function onChanged;
  AdPageDropDown(
      {this.dropDownValue, this.listContent, this.validator, this.onChanged});

  @override
  _AdPageDropDownState createState() => _AdPageDropDownState();
}

class _AdPageDropDownState extends State<AdPageDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              validator: widget.validator,
              onChanged: widget.onChanged,
              isExpanded: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(6),
              ),
              value: widget.dropDownValue,
              items: widget.listContent
                  .map<DropdownMenuItem<String>>((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
