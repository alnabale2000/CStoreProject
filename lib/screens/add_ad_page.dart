import 'package:cstore/components/ad_page_fields.dart';
import 'package:cstore/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNeturalBigColor,
        title: Text('Add Post'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {},
                child: Container(
                  height: 100,
                  width: 150,
                  color: kNeturalBigColor.withOpacity(0.9),
                  child: Center(
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white70,
                      size: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              AdPageTextFiled(
                minLines: 1,
                maxLines: 1,
                icon: Icons.title,
                text: 'Ad Title',
                validator: (val) => val.isEmpty ? 'Add a title' : null,
                onChanged: (val) {},
              ),
              AdPageTextFiled(
                minLines: 1,
                maxLines: 10,
                icon: Icons.description,
                text: 'Ad Description',
                onChanged: (val) {},
              ),
              AdPageTextFiled(
                minLines: 1,
                maxLines: 1,
                icon: Icons.attach_money,
                text: 'Price',
                validator: (val) => val.isEmpty ? 'Enter Price' : null,
                onChanged: (val) {},
              ),
              AdPageTextFiled(
                minLines: 1,
                maxLines: 1,
                icon: Icons.home,
                text: 'Neighborhood',
                onChanged: (val) {},
              ),
              SizedBox(height: 5),
              AdPageDropDown(
                dropDownValue: 'City',
                listContent: ['City', 'Amman', 'Aqaba'],
                validator: (val) => val == 'City' ? 'Choose a City' : null,
              ),
              AdPageDropDown(
                dropDownValue: 'Condition',
                listContent: ['Condition', 'Used', 'New'],
                validator: (val) => val == 'Condition' ? 'Tell us' : null,
              ),
              AdPageDropDown(
                dropDownValue: 'Sale Or Buy',
                listContent: ['Sale Or Buy', 'For Sale', 'Buying'],
                validator: (val) =>
                    val == 'Sale Or Buy' ? 'What do you need?' : null,
              ),
              AdPageDropDown(
                dropDownValue: 'Console Type',
                listContent: ['Console Type', '1', '2', '3', '4'],
                validator: (val) =>
                    val == 'Console Type' ? 'Please Choose a platform' : null,
              ),
              SizedBox(height: 30),
              RoundedButton(
                text: 'CONFIRM',
                color: kNeturalBigColor,
                textColor: Colors.white,
                press: () {
                  if (_formKey.currentState.validate()) {
                    print('all good broo');
                  }
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// keyboardType: TextInputType.multiline,
// minLines: 1,
// maxLines: 5,
