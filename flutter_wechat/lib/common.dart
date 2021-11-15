
import 'package:flutter/material.dart';

//主题色
// ignore: constant_identifier_names
const Color GlobalThemeColor  = Color.fromRGBO(220, 220, 220, 1.0);

double screenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;
