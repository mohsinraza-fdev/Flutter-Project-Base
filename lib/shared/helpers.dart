import 'package:flutter/material.dart';

double screenWidth(BuildContext context, {double multiplier = 1}) => MediaQuery.of(context).size.width * multiplier;
double screenHeight(BuildContext context, {double multiplier = 1}) => MediaQuery.of(context).size.height * multiplier;
double statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;
