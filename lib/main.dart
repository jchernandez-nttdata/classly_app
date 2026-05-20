import 'package:classly_app/classly_app.dart';
import 'package:classly_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  setUpServiceLocator();
  runApp(const ClasslyApp());
}
