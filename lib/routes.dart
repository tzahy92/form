import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:form/form_first_page.dart';
import 'package:form/form_second_page.dart';



class Navigation {
  static final router = FluroRouter();
  static final formFirstPage = "/formFirstPage";
  static final formSecondPage = "/formSecondPage";
}
var firstPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return FormFirstPage();
});
var secondPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return FormSecondPage();
});

void defineRoutes(FluroRouter router) {
  router.define(Navigation.formFirstPage, handler: firstPageHandler);
  router.define(Navigation.formSecondPage, handler: secondPageHandler);
}