import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form/routes.dart';

import 'form_check_box.dart';

class FormFirstPage extends StatelessWidget {
  void _navigateToSecondPage(BuildContext context) {
    Navigation.router.navigateTo(context, Navigation.formSecondPage,
        transition: TransitionType.inFromTop);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("New Account"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.cancel), onPressed: () {})],
        backgroundColor: Colors.grey[500],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.white,
          ),
          Expanded(
            child: AcountForm(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          height: 70,
          color: Colors.yellowAccent[700],
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 50,
          ),
          onPressed: () {
            this._navigateToSecondPage(context);
          },
        ),
      ),
    );
  }
}

class AcountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        children: [
          AccountTextField(
            attribute: 'first_name',
            hint: 'First Name',
          ),
          SizedBox(
            height: 20,
          ),
          AccountTextField(
            attribute: 'last_name',
            hint: 'Last Name',
          ),
          SizedBox(
            height: 20,
          ),
          AccountTextField(
            attribute: 'birthday',
            hint: 'Birthday',
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormCheckBox(
                attribute: 'Male',
                  backgroundColor: Colors.yellow,
                  iconColor: Colors.white,
                  icon: Icons.check
              ),
              SizedBox(
                width: 20,
              ),
              FormCheckBox(
                  attribute: 'Female',
                  backgroundColor: Colors.yellow,
                  iconColor: Colors.white,
                  icon: Icons.check),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountTextField extends StatelessWidget {
  final String hint;
  final String attribute;
  const AccountTextField({
    this.hint,
    @required this.attribute,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      attribute: this.attribute,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: this.hint,
          hintStyle: TextStyle(color: Colors.grey)),
      validators: [
        FormBuilderValidators.required(),
      ],
    );
  }
}
