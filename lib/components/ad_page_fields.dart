import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class AdPageTextFiled extends StatelessWidget {
  final int minLines;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final Function validator;
  final String text;
  final IconData icon;

  AdPageTextFiled(
      {this.minLines,
      this.maxLines,
      this.onChanged,
      this.validator,
      this.text,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        color: Colors.grey[200],
        child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          keyboardType: TextInputType.text,
          minLines: minLines,
          maxLines: maxLines,
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
  AdPageDropDown({this.dropDownValue, this.listContent, this.validator});

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
              onChanged: (String newValue) {
                setState(() {
                  widget.dropDownValue = newValue;
                });
              },
              isExpanded: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(6),
              ),
              hint: Text('City'),
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

// _DropDownFormField() {
//   return FormField<String>(
//     validator: (value) {
//       if (value == null) {
//         return "Select your area";
//       } else
//         return null;
//     },
//     onSaved: (value) {
//       formData['town'] = value;
//     },
//     builder: (
//       FormFieldState<String> state,
//     ) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           new InputDecorator(
//             decoration: const InputDecoration(
//               contentPadding: EdgeInsets.all(0.0),
//               labelText: 'Area',
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 hint: new Text("Select Town"),
//                 value: _town,
//                 onChanged: (String newValue) {
//                   state.didChange(newValue);
//                   setState(() {
//                     _town = newValue;
//                   });
//                 },
//                 items: <String>[
//                   'Sukhchayn Garden',
//                   'Canal Garden',
//                   'Bahria Town',
//                 ].map((String value) {
//                   return new DropdownMenuItem<String>(
//                     value: value,
//                     child: new Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           SizedBox(height: 5.0),
//           Text(
//             state.hasError ? state.errorText : '',
//             style: TextStyle(color: Colors.redAccent.shade700, fontSize: 12.0),
//           ),
//         ],
//       );
//     },
//   );
// }
