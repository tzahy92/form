import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form/routes.dart';
import 'form_first_page.dart';

void main() {
  defineRoutes(Navigation.router);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: FormBuilder(
          key: _formKey,
          initialValue: {},
          child: FormFirstPage()),
    );
  }
}

